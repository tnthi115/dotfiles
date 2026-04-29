---
description: Review code changes with the native code-reviewer agent. Final stage of the workflow.
agent: code-reviewer
subtask: true
---

## Code Review Workflow

The `/review-code` command is the **final stage** of the plan/review/do/review
workflow:

```text
/plan -> plan-reviewer -> Plannotator -> /do -> /review-code
```

This command uses the native `code-reviewer` agent for structured,
findings-first review output.

## Determine Baseline

- If `$ARGUMENTS` is a git range (`HEAD~N`, `SHA..SHA`), use it.
- Otherwise, compute: `git merge-base HEAD origin/main` or
  `git merge-base HEAD origin/master`, falling back to `HEAD~1`.

## Gather Context

Run these with bash:

1. `git diff --stat <baseline>..HEAD`
2. `git diff <baseline>..HEAD` (truncate to 5000 lines if larger; use stat-only
   if 100+ files)
3. `git diff --stat` (unstaged changes)
4. `git diff` (unstaged changes; truncate to 5000 lines if larger)
5. Run linters only for changed-file languages, only if tool is available.

If no committed or unstaged changes exist, report nothing to review and stop.

## Review Coverage

Review **both** committed changes (`<baseline>..HEAD`) **AND** unstaged changes in the working tree. Both are part of the overall change set and must be reviewed.

## Review Method

**Holistic file review — not just the diff.**

1. Read each changed file **in its entirety** (or its most recently modified sections with surrounding context).
2. Review **every line** in the file, not only the lines in the git diff. Fixes and previous reviews may have introduced issues in untouched lines.
3. Walk through the code hunk by hunk, line by line. Do not skim, summarize, or skip sections.

**Skip without comment**: Binary files, lock files, auto-generated code,
vendored dependencies.

**Truncation check**: If context forces truncation, state:
"**WARNING: Partial review detected. Coverage may be incomplete.**"

## Review Checklist

The `code-reviewer` agent evaluates:

- **Correctness**: Logic bugs, edge cases, error handling
- **Algorithm Optimality**: Time/space complexity, redundant iterations
- **Simplicity & Over-Engineering**: YAGNI violations, premature abstractions
- **Clean Code**: Single responsibility, naming, nesting, magic numbers
- **Dead Code**: Unused imports, unreachable branches
- **Architecture**: Separation of concerns, DRY, coupling
- **Security**: Input validation, injection risks, secrets exposure
- **Testing**: Coverage of logic, edge cases
- **Configuration**: Valid syntax, no secrets in config
- **Best Practices**: Idiomatic usage, error handling patterns

## Output Format

The `code-reviewer` agent produces structured output:

### Strengths

List 2-4 specific strengths with file:line references.

### Issues

#### Critical (must fix)

#### Important (should fix)

#### Minor (nice to fix)

### Summary

| Severity | Count |
|----------|-------|
| Critical | [N] |
| Important | [N] |
| Minor | [N] |
| **Total** | **[N]** |

### Assessment

**Ready to merge?** [Yes / With fixes / No]

## Post-Review

Present findings directly — do not reformat.

- **Few/simple issues**: offer to fix directly.
- **Many/complex issues**: offer to create a revised plan.
- **No blocking issues**: guide to `finishing-a-development-branch` skill.

---

`/review-code performs the final code-review stage of the plan/review/do/review workflow using the native code-reviewer agent.`
