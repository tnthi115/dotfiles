---
description: Review code changes. Usage: /review-code [git-range]
agent: review
subtask: true
---

# Code Review

## Determine Baseline

- If `$ARGUMENTS` is a git range (`HEAD~N`, `SHA..SHA`), use it.
- Otherwise, compute: `git merge-base HEAD origin/main` or fall back to
  `HEAD~1`.

## Gather Context

Run these with bash:

1. `git diff --stat <baseline>..HEAD`
2. `git diff <baseline>..HEAD` (truncate to 5000 lines if larger; use
   stat-only if 100+ files)
3. Run linters only for changed-file languages, only if tool is available.

If no changed files exist, report nothing to review and stop.

## Review

Evaluate all changes against your review checklist. Use your configured output
format.

## Post-Review

- **Few/simple issues**: offer to fix directly.
- **Many/complex issues**: offer to create a plan.
- **No blocking issues**: guide to `finishing-a-development-branch` skill.
