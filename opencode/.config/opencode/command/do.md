---
description: Execute an approved plan with the native executor agent. Auto-detects the most recent plan or accepts explicit path.
agent: executor
subtask: true
---

## Required Skills

**Use `superpowers:subagent-driven-development` skill for parallel task execution.**

The skill provides:

- Parallel subagent delegation for independent tasks
- Dependency-aware execution ordering
- Checkpoint validation between batches
- TodoWrite integration for progress tracking
- Clear stopping conditions when blocked

**Why this skill:** OpenCode has full subagent support. Subagent-driven
development is more efficient than sequential executing-plans for complex
multi-file work.

## Fallback

If subagent-driven-development is unavailable, fall back to
`superpowers:executing-plans` for sequential batch execution.

## Execution Environment

**Execute in the current working directory.** Do NOT require or create git
worktrees unless explicitly requested by the user.

The executor agent should:
- Work directly in the current repository
- Use the existing git context (branch, remote, etc.)
- Only stop if there are uncommitted changes that would conflict

---

**CRITICAL: /do executes ONLY approved plans.**

Use `/do` with:
- An approved plan file from `.opencode/plans/` (e.g., `/do @plan-file.md`)
- Equivalent reviewed plan context from the session

## Execution Workflow

The native `executor` agent follows this workflow:

```
/do -> executor -> /review-code -> DONE
```

1. **Execute approved plan in order**
2. **Track progress explicitly** with todos
3. **Work in batches** with verification between
4. **Verify before claiming completion**
5. **Run `/review-code`** for mandatory post-execution review
6. **Stop and surface blockers** instead of freelancing

---

**Step 0: Preflight**

- Verify the plan has been approved (via Plannotator or explicit user approval)
- Check for required dependencies, config files, and environment variables.
- Validate build/test tools are available (e.g., pytest, ruff, mypy, stow).

**Step 1: Plan Analysis**

### Resolve Plan File

**Priority order for plan selection:**

1. **Explicit path**: If `$ARGUMENTS` starts with `@`, read that file directly.
2. **Plan name/keywords**: If `$ARGUMENTS` is a non-empty string without `@`, search `.opencode/plans/` for a filename containing those keywords and use the best match.
3. **Auto-detect recent**: If `$ARGUMENTS` is empty, automatically detect the
   most relevant plan using the procedure below.

### Automatic Detection (NEVER FAILS)

**CRITICAL: This command NEVER fails due to missing plan files.**

**Priority 1: Session Context (Highest)**

Always check for plans from the current session first:
- Plans recently created with `/plan` in this session
- Plans recently reviewed with `/review-plan` in this session
- Plans mentioned in recent conversation context
- Plans referenced in tool outputs from this session
- Any plan the primary agent has been working on

**Priority 2: Most Recent Plan File**

If no session context, automatically use the most recently modified plan file:

```bash
# This always returns a result if any plans exist
ls -t .opencode/plans/*.md 2>/dev/null | head -1
```

**Priority 3: Interactive Selection (Only if Ambiguous)**

If multiple plans exist and context is unclear:

```bash
# Show available plans
ls -t .opencode/plans/*.md 2>/dev/null | head -5 | nl
```

**Auto-select rules:**
- **Single plan**: Use it immediately, announce: "Executing plan: `<filename>`"
- **Clear most recent** (>1 min newer): Use it immediately
- **Ambiguous**: Show list: "Multiple plans found. Select one or provide path: @<path>"

**No-Failure Behavior:**

If no plans directory exists or is empty, guide the user:
```
No plans found in .opencode/plans/

Options:
1. Create a plan: /plan "<description>"
2. Specify a plan: /do @<path-to-plan.md>
3. Provide plan content in this conversation
```

### After Plan Resolution

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

**Plan resolution:**
- NEVER fails - always finds a plan or guides user to create one
- No "Could not determine" errors

**Execution errors:**
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

**Step 7: Post-Execution Review (CRITICAL)**

After all plan tasks are completed and verified:

1. **Automatically run `/review-code`** to review all changes made during execution
2. Present the review findings to the user with severity categorization
3. Offer to fix any issues found or proceed to completion

**Do NOT skip this step** - code review is mandatory after `/do` execution.

This mirrors the `/plan` → plan-reviewer workflow and ensures consistent
quality gates.

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
