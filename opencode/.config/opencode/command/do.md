---
description: Execute an implementation plan with build agent. Use `/do` for session plan or `/do @plan-file.md` for specific plan file.
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

**Step 0: Preflight**

- Check for required dependencies, config files, and environment variables.
- Validate build/test tools are available (e.g., pytest, ruff, mypy, stow).

**Step 1: Plan Analysis**

- Use plan from file context (if @ file provided) or session conversation.
- Identify targets, dependencies, and code patterns; follow existing patterns.

**Step 2: Implementation**

- Read target files and apply changes.
- After each change, run relevant linters/formatters/tests for changed files.
- Validate imports and dependencies incrementally.

**Step 3: Validation**

- Run full quality gates and test suite.
- Summarize results and generate an execution summary.

**Step 4: Error Handling**

- If a step fails, auto-diagnose, log, and halt further changes.
- Suggest or attempt rollback if possible.

**Step 5: Clean-Up**

- Remove temp files and revert partial changes if needed.
- Ensure repo is in a consistent, ready-to-commit state.

**Guidelines:**

- Follow AGENTS.md tool selection guide: use native LSP/AST tools by default,
  Serena for symbol editing and memory.
- Use Serena memory (write concise progress after each step) for multi-step
  tasks spanning compaction.
- Use Context7 for documentation and code reference.
- Use Sequential Thinking for complex or multi-step tasks.
- Keep logs and memory concise to optimize context usage.
