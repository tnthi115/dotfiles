---
description: Smart review dispatcher. Usage: /review [plan | changes | code | keywords plan]
agent: general
subtask: true
---

# Review Command

Thin dispatcher: resolve input, gather context, hand off to the right agent.

## Input Resolution

1. **Explicit plan file** (`@path/to/plan.md`): Plan Review mode.
2. **`plan`** keyword alone: find most recently modified `.sisyphus/plans/*.md`.
3. **`<keywords> plan`** (e.g. `sandbox migration plan`): fuzzy-match plans in
   `.sisyphus/plans/` by keyword in filename and first 60 lines. Pick best
   match; if tied, pick most recent. If no match, list top 3 recent plans and
   stop.
4. **`changes`** or **`code`** keyword alone: Code Review mode on `<baseline>..HEAD`.
5. **Git range** (`HEAD~N`, `SHA..SHA`): Code Review mode on that range.
6. **Empty** (`/review`): auto-detect — if code changes exist on current branch
   use Code Review; else if plans exist, review latest plan; else report
   nothing to review.

## Plan Review

1. Read the resolved plan file. If unreadable/empty, report error and stop.
2. Dispatch to Momus using the `task` tool:
   `subagent_type="momus"`, `run_in_background=false`.
   Pass the full plan content as the prompt. Do not add custom checklists —
   Momus has its own protocol.
3. If Momus fails/times out, dispatch a review subagent instead using the
   `task` tool: `category="unspecified-high"`,
   `load_skills=["superpowers/requesting-code-review"]`. Ask it to review the
   plan for completeness, feasibility, quality, and executability.
4. Present findings in the output format below.

## Code Review

1. Determine baseline: explicit range, or `git merge-base HEAD origin/main`,
   or `HEAD~1`.
2. Get changed files. If none, report nothing to review and stop.
3. Gather context (run these with bash):
   - `git diff --stat <baseline>..HEAD`
   - `git diff --no-binary <baseline>..HEAD` (truncate to 5000 lines if larger;
     use stat-only if 100+ files)
   - Run linters only for changed-file languages, only if tool is available
4. Dispatch a review subagent using the `task` tool:
   `category="unspecified-high"`,
   `load_skills=["superpowers/requesting-code-review"]`.
   Include diff stat, full diff, linter output, and plan context (if any) in
   the prompt. Instruct it to evaluate correctness, completeness, and quality.
5. Present findings in the output format below.

## Output Format

```markdown
# Review: {Plan Name | Branch/Commit Range}

**Mode**: Plan Review | Code Review
**Target**: {plan file path | git range}
**Files Changed**: {N/A | N files (+X, -Y)}

---

## Findings

{Agent findings here}

---

## Summary

| Severity | Count |
|----------|-------|
| Critical | N |
| Important | N |
| Minor | N |

**Recommendation**: {fix issues | ready for integration}
```

## Post-Review

- **Few/simple issues**: offer to fix directly.
- **Many/complex issues**: offer to create a plan.
- **No blocking issues**: guide to `finishing-a-development-branch` skill.
