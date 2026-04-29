---
description: Review an implementation plan with the native plan-reviewer agent. On-demand plan critique.
agent: plan-reviewer
subtask: true
---

## Plan Review Workflow

The `/review-plan` command provides **on-demand plan review** using the native
`plan-reviewer` agent. Use this when you want critique on a plan before or after
`/plan` generation, or when reviewing plans created outside the standard workflow.

## Usage

```
/review-plan                    # Review the most recent plan (RECOMMENDED)
/review-plan @path/to/plan.md   # Review specific plan file
/review-plan <keywords>         # Find plan by keywords
```

**Default behavior:** When run without arguments, `/review-plan` automatically finds and reviews the most recently modified plan in `.opencode/plans/`. This is the typical workflow — just run `/review-plan` after creating a plan with `/plan`.

## Resolve Plan File

The command resolves which plan to review using this priority:

### Priority Order

1. **Explicit path**: If `$ARGUMENTS` starts with `@`, read that exact file
2. **Keyword match**: If `$ARGUMENTS` contains keywords, find best-matching filename
3. **Auto-detect**: Use session context or file modification time
4. **Interactive selection**: Ask user to choose from available plans

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

**Step 3: Interactive Plan Selection (if needed)**

If detection is ambiguous or user may want to choose, present numbered options:

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
- If only one plan exists: Use it automatically
- If one plan is clearly most recent (>1 min newer than others): Use it automatically
- If tied or ambiguous: Show numbered list

**Example workflow:**
```
/plan "Implement user authentication"    # Creates .opencode/plans/auth-plan.md
/review-plan                              # Automatically reviews auth-plan.md
/do                                       # Automatically executes auth-plan.md
```

## Review Method

**Read the entire plan file critically.** Do not skim, summarize, or rely on partial context. Walk through each task from beginning to end:

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

## Error Handling

**No plan files found:**
```
No plan files found in .opencode/plans/

Create a plan first with: /plan "<description>"
Or specify a path explicitly: /review-plan @<path-to-plan.md>
```

**Invalid selection:**
```
Invalid selection. Please enter a number between 1 and N, or provide an explicit path.
```

## Post-Review

- **APPROVE**: Plan is ready for execution with `/do` or manual implementation.
- **APPROVE_WITH_NOTES**: Plan is acceptable but has minor issues worth noting.
- **REQUEST_CHANGES**: Plan has significant gaps or errors that should be fixed before execution.

---

`/review-plan provides on-demand plan critique using the native plan-reviewer agent.`
