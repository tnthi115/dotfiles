---
description: Review the most recent plan and fix ALL issues of all severity levels. Uses /review-plan and @plan-reviewer for detailed plan review, then iteratively fixes until zero remain.
subtask: true
agent: plan-reviewer
---

You are the `@plan-reviewer` subagent. Your job is to run an **iterative review-and-fix loop entirely within this subtask**.

## Workflow

```
Cycle 1: Run /review-plan → receive findings → fix ALL issues → Cycle 2
Cycle 2: Run /review-plan → receive findings → fix ALL issues → Cycle 3
... repeat until zero issues OR max 5 cycles
```

**All work happens inside this subtask.** Do not return to the parent agent between cycles. Perform the review, apply fixes, and re-review yourself.

## Step 1: Initial Plan Review

Run `/review-plan` (or emulate its exact behavior) to get a comprehensive review.

### Resolve Plan File

**Priority order for plan selection:**

1. **Explicit path**: If `$ARGUMENTS` starts with `@`, read that file directly.
2. **Plan name/keywords**: If `$ARGUMENTS` is a non-empty string without `@`, search `.opencode/plans/` for a filename containing those keywords and use the best match.
3. **Auto-detect recent**: If `$ARGUMENTS` is empty, automatically detect the most relevant plan using the procedure below.

### Automatic Detection (when no arguments provided)

**Step 1: Check Session Context First**

Look for plans mentioned or worked on in the current session:
- Plans recently created with `/plan`
- Plans recently reviewed with `/review-plan`
- Plans mentioned in recent conversation context
- Plans referenced in tool outputs

**Step 2: Fall Back to File Modification Time**

If no clear session context, use file modification time:

```bash
# List all plans sorted by modification time (most recent first)
ls -t .opencode/plans/*.md 2>/dev/null
```

**Step 3: Ask the Primary Agent (if still unclear)**

If after Steps 1 and 2 the plan cannot be determined unambiguously:

**Return a clear request to the parent agent:**
```
Could not determine which plan to review.

Please supply the plan using one of:
  /review-plan-fix @<path-to-plan.md>
  /review-plan-fix <plan-name-or-keywords>

Or provide the plan content/context from this session and retry /review-plan-fix.
```

The parent agent can then re-invoke `/review-plan-fix` with the correct plan.

**Step 4: Interactive Plan Selection (if needed)**

If multiple plans exist and the user is interactive, present numbered options:

```bash
# List plans with numbers for selection
ls -t .opencode/plans/*.md 2>/dev/null | head -5 | nl
```

**Present to user:**
```
No explicit plan specified. Available plans (most recent first):

  1) disk-space-cleanup-plan.md        (modified 2 hours ago)
  2) init-deep-command-plan.md         (modified yesterday)
  3) opencode-workflow-optimization-plan.md (modified 2 days ago)

Enter a number (1-3) to select, or provide explicit path: @<path>
```

**Auto-select if clear:**
- If only one plan exists: Use it automatically and announce: "Reviewing plan: `<filename>`"
- If one plan is clearly most recent (>1 min newer than others): Use it automatically
- If tied or ambiguous: Ask the parent agent (Step 3) or show numbered list (Step 4)

**If no plans found:**
```
No plan files found in .opencode/plans/

Create a plan first with: /plan "<description>"
Or specify a path explicitly: /review-plan-fix @<path-to-plan.md>
```

## Step 2: Fix ALL Issues

After review returns findings:

**Critical rule**: Fix **EVERY** issue of **ALL** severity levels—Critical, Important, and Minor. Do not skip any category. Do not ask anyone which ones to fix. Just fix them all.

For each issue:
- Identify the task/step and the specific problem.
- Read the relevant plan sections.
- Apply the minimal, correct fix.
- Verify the fix preserves plan structure and consistency.

## Step 3: Re-Review (Inside This Subtask)

After all issues are fixed, run `/review-plan` **again** on the same plan—**still within this subtask**.

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
| Critical |   2   |   2   |     0     |
| Important|   4   |   4   |     0     |
| Minor    |   1   |   1   |     0     |
| **Total**|  **7**|  **7**|    **0**   |

Status: ✅ All issues resolved.
```

Or if stopping:

```
Stopped after N cycles. Remaining issues:
- [Task N, Step X] [severity] [description]
```

---

`/review-plan-fix reviews the most recent plan and iteratively fixes every issue of every severity until zero remain, all inside a single subagent call.`
