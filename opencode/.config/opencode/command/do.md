---
description: Execute an approved plan with the native executor agent. Auto-detects the most recent plan or accepts explicit path.
agent: executor
subtask: true
---

## Required Skills

**Use `superpowers:subagent-driven-development` skill for parallel task execution.**

The skill provides:

- Parallel subagent delegation for independent tasks
- Dependency-aware execution ordering
- Checkpoint validation between batches
- TodoWrite integration for progress tracking
- Clear stopping conditions when blocked

**Why this skill:** OpenCode has full subagent support. Subagent-driven
development is more efficient than sequential executing-plans for complex
multi-file work.

## Fallback

If subagent-driven-development is unavailable, fall back to
`superpowers:executing-plans` for sequential batch execution.

## Execution Environment

**Execute in the current working directory.** Do NOT require or create git
worktrees unless explicitly requested by the user.

The executor agent should:
- Work directly in the current repository
- Use the existing git context (branch, remote, etc.)
- Only stop if there are uncommitted changes that would conflict

---

**CRITICAL: /do executes ONLY approved plans.**

Use `/do` with:
- An approved plan file from `.opencode/plans/` (e.g., `/do @plan-file.md`)
- Equivalent reviewed plan context from the session

## Execution Workflow

The native `executor` agent follows this workflow:

```
/do -> executor -> /review-code -> DONE
```

1. **Execute approved plan in order**
2. **Track progress explicitly** with todos
3. **Work in batches** with verification between
4. **Verify before claiming completion**
5. **Run `/review-code`** for mandatory post-execution review
6. **Stop and surface blockers** instead of freelancing

---

**Step 0: Preflight**

- Verify the plan has been approved (via Plannotator or explicit user approval)
- Check for required dependencies, config files, and environment variables.
- Validate build/test tools are available (e.g., pytest, ruff, mypy, stow).

**Step 1: Plan Analysis**

### Resolve Plan File

**Priority order for plan selection:**

1. **Explicit path**: If `$ARGUMENTS` starts with `@`, read that file directly.
2. **Plan name/keywords**: If `$ARGUMENTS` is a non-empty string without `@`, search `.opencode/plans/` for a filename containing those keywords and use the best match.
3. **Auto-detect recent**: If `$ARGUMENTS` is empty, automatically detect the
   most relevant plan using the procedure below.

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
Could not determine which plan to execute.

Please supply the plan using one of:
  /do @<path-to-plan.md>
  /do <plan-name-or-keywords>

Or provide the plan content/context from this session and retry /do.
```

The parent agent can then re-invoke `/do` with the correct plan.

**Step 4: Interactive Plan Selection (if needed)**

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
- If only one plan exists: Use it automatically and announce: "Executing plan: `<filename>`"
- If one plan is clearly most recent (>1 min newer than others): Use it automatically
- If tied or ambiguous: Ask the parent agent (Step 3) or show numbered list (Step 4)

**If no plans found:**
```
No plan files found in .opencode/plans/

Create a plan first with: /plan "<description>"
Or specify a path explicitly: /do @<path-to-plan.md>
```

### After Plan Resolution

- Read the approved plan from `.opencode/plans/` or session context.
- Identify targets, dependencies, and code patterns; follow existing patterns.

**Step 2: Implementation**

- Read target files and apply changes.
- Execute tasks in order as specified in the plan.
- After each change, run relevant linters/formatters/tests for changed files.
- Validate imports and dependencies incrementally.
- **CRITICAL: Do not expand scope beyond the approved plan.**

**Step 3: Validation**

- Run full quality gates and test suite.
- Verify all acceptance criteria are met.
- Summarize results and generate an execution summary.

**Step 4: Error Handling**

**Plan resolution errors:**
- No plan files found → Clear error message with suggestion to use `/plan`
- Invalid user selection → Re-prompt for valid number or explicit path

**Execution errors:**
- If a step fails, auto-diagnose, log, and halt further changes.
- Suggest or attempt rollback if possible.
- **After 3 failed attempts**: Stop, revert, document, and ask user.

**Step 5: Clean-Up**

- Remove temp files and revert partial changes if needed.
- Ensure repo is in a consistent, ready-to-commit state.

**Step 6: Evidence & Summary**

End with verification evidence:
- Build passes (exit code 0)
- Tests pass
- `lsp_diagnostics` clean on changed files
- Concise execution summary

**Step 7: Post-Execution Review (CRITICAL)**

After all plan tasks are completed and verified:

1. **Automatically run `/review-code`** to review all changes made during execution
2. Present the review findings to the user with severity categorization
3. Offer to fix any issues found or proceed to completion

**Do NOT skip this step** - code review is mandatory after `/do` execution.

This mirrors the `/plan` → plan-reviewer workflow and ensures consistent
quality gates.

**Guidelines:**

- Follow AGENTS.md tool selection guide: use native LSP/AST tools by default,
  Serena for symbol editing and memory.
- Use Serena memory (write concise progress after each step) for multi-step
  tasks spanning compaction.
- Use Context7 for documentation and code reference.
- Use Sequential Thinking for complex or multi-step tasks.
- Keep logs and memory concise to optimize context usage.

---

`/do executes an approved plan with the executor agent and stops at blockers instead of improvising scope.`
