---
description: Smart review dispatcher. Usage: /review [plan | changes | code | keywords plan]
agent: general
subtask: true
---

# Review Command

Thin dispatcher: resolve input and dispatch.

## Step 1: Determine Mode

Normalize first:

- `ARGS = lowercase(trim($ARGUMENTS))`
- Collapse repeated spaces in `ARGS`.

Use only `ARGS` below.

Classify `ARGS` in this order:

1. Exactly `changes` or `code` → MODE = **Code Review**
2. Exactly `plan` → MODE = **Plan Review** (latest plan)
3. Starts with `@` and points to a markdown file → MODE = **Plan Review**
4. Ends with a `plan` suffix (for example: `sandbox migration plan`) →
   fuzzy-match `.sisyphus/plans/`:
   - exactly 1 match → MODE = **Plan Review**
   - 0 or multiple matches → stop and ask for `plan` or `@path/to/plan.md`
5. Looks like a git range (`HEAD~N`, `SHA..SHA`) → MODE = **Code Review**
6. Empty `ARGS` → auto-detect:
   - if branch/uncommitted code changes exist, MODE = **Code Review**
   - else if plans exist, MODE = **Plan Review**
   - else report nothing to review
7. Non-empty unmatched input → MODE = **Code Review** (safe default)

## Critical Rules

- Determine MODE once.
- Execute only the matching section.
- Never call Momus unless MODE = Plan Review.

## Plan Review

1. Read the resolved plan file. If unreadable/empty, report error and stop.
2. Dispatch to Momus using the `task` tool:
   `subagent_type="momus"`, `run_in_background=false`.
   Pass full plan content. Do not add custom checklists.
3. If Momus fails/times out, dispatch a review subagent instead using the
   `task` tool: `category="unspecified-high"`,
   `load_skills=["superpowers/requesting-code-review"]`.
   Ask for plan completeness, feasibility, quality, and executability.
4. Present findings in the output format below.

## Code Review

1. Determine baseline: explicit range, or `git merge-base HEAD origin/main`,
   or `HEAD~1`.
2. Get changed files. If none, report nothing to review and stop.
3. Gather context (run these with bash):
   - `git diff --stat <baseline>..HEAD`
   - `git diff <baseline>..HEAD` (truncate to 5000 lines if larger; use
     stat-only if 100+ files)
   - Run linters only for changed-file languages, only if tool is available
4. Dispatch a review subagent using the `task` tool:
   `category="unspecified-high"`,
   `load_skills=["superpowers/requesting-code-review"]`.
   Include diff stat, full diff, linter output, and plan context (if any).
   Instruct it to evaluate correctness, completeness, and quality.
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
