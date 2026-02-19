---
description: Two-pass structured review for plans or code. Usage: /review [@plan.md] [git-range]
---

# Review Command

You are orchestrating a structured two-pass review. Your job is to:

1. Detect review mode (plan vs code)
2. Gather context
3. Run Pass 1 with @review agent
4. Run Pass 2 with @review agent
5. Combine results into unified report

## Mode Detection

Analyze the input to determine mode:

| Input Pattern | Mode | Action |
|---------------|------|--------|
| `@path/to/file.md` only (contains `.sisyphus/plans/` OR has plan markers) | **Plan Review** | Review plan quality |
| No args | **Code Review** | Review changes since origin/main |
| Git range (HEAD~N, SHA..SHA) | **Code Review** | Review specified commits |
| `@plan.md` + git range | **Code Review** | Review code with plan as Pass 1 context |

**Plan markers**: `## TODOs`, `## Work Objectives`, `## Success Criteria`, `## Must Have`

## Context Gathering

### For Plan Review Mode

1. Read the plan file
2. Extract key sections: objectives, requirements, success criteria, TODOs

### For Code Review Mode

1. Determine git baseline:
   - If range provided: use it
   - Else: `git merge-base HEAD origin/main` or `HEAD~1` as fallback

2. Get changed files:
   ```bash
   git diff --stat <baseline>..HEAD
   git diff <baseline>..HEAD
   ```

3. Find plan context (best effort, in order):
   - Explicit `@plan.md` argument
   - Recent files in `.sisyphus/plans/`
   - Branch name hints (feature/AUTH-123)
   - Commit message references

4. Detect languages from changed files

5. Run configured linters (capture output for Pass 2):
   ```bash
   # Python
   ruff check . 2>&1 || true

   # TypeScript/JavaScript
   npx eslint . 2>&1 || true

   # Go
   go vet ./... 2>&1 || true
   ```

## Pass 1: Correctness & Completeness

Invoke @review agent with pass-specific instructions.

### Pass 1 Instructions for Plan Review

Prompt the @review agent with:

```
You are reviewing a PLAN for completeness and feasibility.

**Plan Content:**
[Insert plan content here]

**Checklist - verify each item:**

1. **Requirements Capture**
   - Are all requirements from the original request present?
   - Is anything mentioned in objectives missing from TODOs?

2. **Scope Boundaries**
   - Clear "Must Have" section?
   - Clear "Must NOT Have" section?
   - Are exclusions explicit?

3. **Success Criteria**
   - Defined and measurable?
   - Can be verified with commands?

4. **Dependencies**
   - Task dependencies identified?
   - Execution order respects dependencies?

5. **Verification Strategy**
   - Test approach defined (TDD/tests-after/QA-only)?
   - QA scenarios present for each task?

Report findings using the standard output format.
```

### Pass 1 Instructions for Code Review

Prompt the @review agent with:

```
You are reviewing CODE CHANGES for correctness and completeness.

**Git Range:** <baseline>..HEAD
**Changed Files:**
[Insert git diff --stat output]

**Plan Context (if available):**
[Insert plan content or "No plan context found"]

**Checklist - verify each item:**

1. **Issue Resolution** (if plan context available)
   - Was the original issue/objective addressed?
   - Does the implementation match the plan?

2. **Requirement Coverage**
   - All planned features implemented?
   - Nothing obviously missing?

3. **Success Criteria** (if defined in plan)
   - Do deliverables meet defined metrics?

4. **Scope Fidelity**
   - Nothing missing from plan?
   - No scope creep (unplanned additions)?

5. **Edge Cases**
   - Boundary conditions handled?
   - Error scenarios covered?

6. **Integration**
   - Works with existing system components?
   - No obvious breaking changes?

Report findings using the standard output format.
If no plan context: Note "Plan context not found - correctness review based on observable code behavior only"
```
