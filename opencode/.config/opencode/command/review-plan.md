---
description: Review an implementation plan with the native plan-reviewer agent. On-demand plan critique.
agent: plan-reviewer
subtask: true
---

## Plan Review Workflow

The `/review-plan` command provides **on-demand plan review** using the native
`plan-reviewer` agent. Use this when you want critique on a plan before or after
`/plan` generation, or when reviewing plans created outside the standard workflow.

## Resolve Plan File

- If `$ARGUMENTS` starts with `@`, read that file.
- If `$ARGUMENTS` contains keywords, find the best-matching filename in
  `.opencode/plans/`. If ambiguous, list matches and stop.
- If `$ARGUMENTS` is empty, use the most recently modified
  `.opencode/plans/*.md`.
- If no plan found, report error and stop.

## Review Method

**Read the plan critically.** Do not skim. Walk through each task:

- Is the task sequence logical?
- Are file paths exact and correct?
- Are verification steps specific and testable?
- Are edge cases and error conditions handled?
- Is the plan achievable in the stated scope?

## Review Checklist

The `plan-reviewer` agent evaluates:

- **Completeness**: All spec requirements have corresponding tasks
- **Correctness**: Technical approach is sound, no logical errors
- **Feasibility**: Tasks are achievable in the stated scope
- **Dependencies**: Task ordering respects dependencies
- **Testing**: Verification steps are specific and testable
- **Edge Cases**: Error conditions and boundary cases are handled
- **Clarity**: Instructions are unambiguous, file paths are exact
- **Granularity**: Tasks are appropriately sized (not too large/small)

## Output Format

The `plan-reviewer` agent produces structured output:

### Assessment
**Verdict:** [APPROVE / APPROVE_WITH_NOTES / REQUEST_CHANGES]

### Issues Found (max 3)
Only list issues if verdict is REQUEST_CHANGES or APPROVE_WITH_NOTES.

#### [Issue 1]: [Brief title]
- **Location**: Task N, Step X
- **Problem**: [Specific description]
- **Fix**: [Specific correction or guidance]

### Strengths
List 2-3 specific strengths of the plan.

## Post-Review

- **APPROVE**: Plan is ready for execution with `/do` or manual implementation.
- **APPROVE_WITH_NOTES**: Plan is acceptable but has minor issues worth noting.
- **REQUEST_CHANGES**: Plan has significant gaps or errors that should be fixed before execution.

---

`/review-plan provides on-demand plan critique using the native plan-reviewer agent.`
