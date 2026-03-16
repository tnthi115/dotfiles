---
description: Review an implementation plan. Usage: /review-plan [plan-path | keywords]
agent: general
subtask: true
---

# Plan Review

Review an implementation plan via Momus.

## Resolve Plan File

- If `$ARGUMENTS` starts with `@` and points to a markdown file, use that
  file.
- If `$ARGUMENTS` contains keywords, fuzzy-match `.sisyphus/plans/` by
  keyword in filename and first 60 lines. Use the match only if exactly 1
  result; otherwise list top 3 and stop.
- If `$ARGUMENTS` is empty, use the most recently modified
  `.sisyphus/plans/*.md`.
- If no plan file is found, report error and stop.

## Dispatch

1. Read the resolved plan file.
2. Dispatch to Momus using the `task` tool:
   `subagent_type="momus"`, `run_in_background=false`.
   Pass full plan content. Do not add custom checklists.
3. If Momus fails or times out, dispatch a review subagent instead using the
   `task` tool: `category="unspecified-high"`,
   `load_skills=["superpowers/requesting-code-review"]`.
   Ask for plan completeness, feasibility, quality, and executability.

## Output Format

```markdown
# Review: {Plan Name}

**Mode**: Plan Review
**Target**: {plan file path}

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
