---
description: Review code changes on this branch and fix ALL issues of all severity levels. Uses /review-code and @code-reviewer for detailed plan review, then iteratively fixes until zero remain.
subtask: true
agent: code-reviewer
---

You are the `@code-reviewer` subagent. Your job is to run an **iterative review-and-fix loop entirely within this subtask**.

## Workflow

```
Cycle 1: Run /review-code → receive findings → fix ALL issues → Cycle 2
Cycle 2: Run /review-code → receive findings → fix ALL issues → Cycle 3
... repeat until zero issues OR max 5 cycles
```

**All work happens inside this subtask.** Do not return to the parent agent between cycles. Perform the review, apply fixes, and re-review yourself.

## Step 1: Initial Code Review

Run `/review-code` (or emulate its exact behavior) to get a comprehensive review of all changes on this branch.

**Determine baseline**:
- If the user provided a git range (HEAD~N, SHA..SHA), use it.
- Otherwise compute: `git merge-base HEAD origin/main` or `git merge-base HEAD origin/master`, falling back to `HEAD~1`.

## Step 2: Fix ALL Issues

After review returns findings:

**Critical rule**: Fix **EVERY** issue of **ALL** severity levels—Critical, Important, and Minor. Do not skip any category. Do not ask anyone which ones to fix. Just fix them all.

For each issue:
- Identify the file and line number.
- Read the relevant code context.
- Apply the minimal, correct fix.
- Run linters/formatters/tests for the changed file.
- Verify with `lsp_diagnostics` that the fix is clean.

## Step 3: Re-Review (Inside This Subtask)

After all issues are fixed, run `/review-code` **again** on the same baseline—**still within this subtask**.

- If zero issues: stop and report success.
- If any issues remain: go back to **Step 2**.

## Stopping Conditions

- **Success**: Review returns zero issues across all severity levels.
- **Max iterations**: After 5 review-fix cycles, stop and report remaining issues.
- **Blockers**: If a fix cannot be made safely, stop and surface the blocker.

## Output Format

Report progress after each cycle:

```
Cycle N review complete:
| Severity | Found | Fixed | Remaining |
|----------|-------|-------|-----------|
| Critical |   3   |   3   |     0     |
| Important|   5   |   5   |     0     |
| Minor    |   2   |   2   |     0     |
| **Total**| **10**| **10**|    **0**   |

Status: ✅ All issues resolved.
```

Or if stopping:

```
Stopped after N cycles. Remaining issues:
- [file:line] [severity] [description]
```

---

`/review-fix reviews code changes and iteratively fixes every issue of every severity until zero remain, all inside a single subagent call.`
