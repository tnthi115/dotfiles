---
description: Execute an approved plan with the native executor agent. Requires an approved plan file.
agent: executor
subtask: true
---

## Required Skills

**REQUIRED:** Use `superpowers:executing-plans` skill for disciplined plan
execution.

The skill provides:

- Batch execution with checkpoints (default: 3 tasks per batch)
- Review gates between batches
- TodoWrite integration for progress tracking
- Clear stopping conditions when blocked

This command provides the framework; the skill provides the discipline.

---

**CRITICAL: /do executes ONLY approved plans.**

Use `/do` with:
- An approved plan file from `.opencode/plans/` (e.g., `/do @plan-file.md`)
- Equivalent reviewed plan context from the session

## Execution Workflow

The native `executor` agent follows this workflow:

1. **Execute approved plan in order**
2. **Track progress explicitly** with todos
3. **Work in batches** with verification between
4. **Verify before claiming completion**
5. **Stop and surface blockers** instead of freelancing

---

**Step 0: Preflight**

- Verify the plan has been approved (via Plannotator or explicit user approval)
- Check for required dependencies, config files, and environment variables.
- Validate build/test tools are available (e.g., pytest, ruff, mypy, stow).

**Step 1: Plan Analysis**

- Read the approved plan from `.opencode/plans/` or session context.
- Identify targets, dependencies, and code patterns; follow existing patterns.

**Step 2: Implementation**

- Read target files and apply changes.
- Execute tasks in order as specified in the plan.
- After each change, run relevant linters/formatters/tests for changed files.
- Validate imports and dependencies incrementally.
- **CRITICAL: Do not expand scope beyond the approved plan.**

**Step 3: Validation**

- Run full quality gates and test suite.
- Verify all acceptance criteria are met.
- Summarize results and generate an execution summary.

**Step 4: Error Handling**

- If a step fails, auto-diagnose, log, and halt further changes.
- Suggest or attempt rollback if possible.
- **After 3 failed attempts**: Stop, revert, document, and ask user.

**Step 5: Clean-Up**

- Remove temp files and revert partial changes if needed.
- Ensure repo is in a consistent, ready-to-commit state.

**Step 6: Evidence & Summary**

End with verification evidence:
- Build passes (exit code 0)
- Tests pass
- `lsp_diagnostics` clean on changed files
- Concise execution summary

**Guidelines:**

- Follow AGENTS.md tool selection guide: use native LSP/AST tools by default,
  Serena for symbol editing and memory.
- Use Serena memory (write concise progress after each step) for multi-step
  tasks spanning compaction.
- Use Context7 for documentation and code reference.
- Use Sequential Thinking for complex or multi-step tasks.
- Keep logs and memory concise to optimize context usage.

---

`/do executes an approved plan with the executor agent and stops at blockers instead of improvising scope.`
