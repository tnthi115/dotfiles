---
description: Review an implementation plan. Usage: /review-plan [plan-path | keywords]
agent: general
subtask: true
---

# Plan Review

Iteratively review the plan using Metis and Momus, applying fixes after each
review pass, until no blocking issues remain.

## Resolve Plan File

- If `$ARGUMENTS` starts with `@`, read that file.
- If `$ARGUMENTS` contains keywords, find the best-matching filename in
  `.sisyphus/plans/`. If ambiguous, list matches and stop.
- If `$ARGUMENTS` is empty, use the most recently modified
  `.sisyphus/plans/*.md`.
- If no plan found, report error and stop.

## Dispatch

1. Read the resolved plan file fully.
2. Dispatch to Momus: `task(subagent_type="momus", run_in_background=false)`.
   Pass the full plan content as the prompt. Do not add custom checklists —
   Momus has its own review protocol.
3. If Momus fails or times out, review the plan yourself. Evaluate: clarity,
   verifiability of acceptance criteria, sufficient context for implementation,
   and overall feasibility.

## Post-Review

Present Momus findings (or your own) directly — do not reformat.

- **Few/simple issues**: offer to fix directly.
- **Many/complex issues**: offer to create a revised plan.
- **No blocking issues**: guide to `finishing-a-development-branch` skill.
