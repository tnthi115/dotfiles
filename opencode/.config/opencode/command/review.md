---
description: Smart review with agent routing. Usage: /review [@plan.md] [git-range]
agent: general
subtask: true
---

# Review Command

You are orchestrating a smart review with agent routing. Your job is to:

1. Detect review mode and determine routing
2. Run early exit checks
3. Dispatch to the appropriate agent(s)
4. Present unified output

## Mode Detection

Analyze the input to determine mode and routing:

| Input Pattern | Mode | Routing |
|---------------|------|---------|
| `@path/to/file.md` (in `.sisyphus/plans/` OR has plan markers) | **Plan Review** | Momus |
| No args (≤5 changed files) | **Code Review (Fast)** | @review only |
| No args (6+ files OR files>2 AND dirs>2) | **Code Review (Deep)** | explore + @review |
| Git range (`HEAD~N`, `SHA..SHA`) | **Code Review** | Threshold-based (see below) |
| `@plan.md` + git range | **Code Review + Plan Context** | Threshold-based (see below) |

**Plan markers**: `## TODOs`, `## Work Objectives`, `## Success Criteria`,
`## Must Have`

**Threshold-based routing**: Count changed files and distinct directories from
the diff. If ≤5 files → Fast. If 6+ files OR (files>2 AND dirs>2) → Deep.

## Early Exit Checks

Before dispatching, verify there is something to review:

**For Plan Review**:

1. Read the file. If it cannot be read or is empty, report:
   `"Error: Cannot read plan file: {path}"` and stop.

**For Code Review**:

1. Determine git baseline:
   - If range provided: use it
   - Else: `git merge-base HEAD origin/main` or `HEAD~1` as fallback

2. Get changed files:

   ```bash
   git diff --name-only <baseline>..HEAD
   ```

3. If no changed files, report:
   `"No changes found in range <baseline>..HEAD. Nothing to review."` and stop.

4. Count files and distinct directories:

   ```bash
   FILE_COUNT=$(git diff --name-only <baseline>..HEAD | wc -l)
   DIR_COUNT=$(git diff --name-only <baseline>..HEAD | xargs -I{} dirname {} | sort -u | wc -l)
   ```

5. Detect languages from changed file extensions.

6. Run configured linters (capture output for review):

   ```bash
   # Python
   ruff check . 2>&1 || true

   # TypeScript/JavaScript
   npx eslint . 2>&1 || true

   # Go
   go vet ./... 2>&1 || true
   ```

7. Find plan context (best effort, in order):
   - Explicit `@plan.md` argument
   - Recent files in `.sisyphus/plans/`
   - Branch name hints (feature/AUTH-123)
   - Commit message references

## Plan Review Flow (Momus)

When mode is **Plan Review**, dispatch to Momus for ruthless plan critique.

### Steps

1. Read the full plan file content.

2. Dispatch to Momus:

   ```
   task(
     subagent_type="momus",
     load_skills=[],
     description="Review plan: {plan-file-name}",
     prompt="{full plan file content}",
     run_in_background=false
   )
   ```

   Do NOT add custom review checklists to the Momus prompt. Momus has its own
   built-in review protocol. Pass the plan content directly and let Momus
   apply its own standards.

3. Interpret Momus verdict:
   - **OKAY**: Plan passes. Present findings in unified output format with
     recommendation "Ready for execution."
   - **REJECT**: Plan fails. Present findings in unified output format with
     the specific issues Momus identified. Recommendation: "Fix N issues
     before execution."

### Fallback

If Momus dispatch fails (timeout, error, unavailable), fall back to @review
agent with the original two-pass approach:

1. Invoke @review with Pass 1 (completeness and feasibility):

   ```
   You are reviewing a PLAN for completeness and feasibility.

   **Plan Content:**
   {full plan content}

   Evaluate: requirements capture, scope boundaries, success criteria,
   dependencies, and verification strategy. Report findings.
   ```

2. Invoke @review with Pass 2 (quality and executability):

   ```
   You are reviewing a PLAN for quality and executability.

   **Plan Content:**
   {full plan content}

   Evaluate: task granularity, QA scenarios, execution order, risk
   identification, and template compliance. Report findings.
   ```

3. Combine results into unified output format.

## Code Review Flow — Fast Path (≤5 files)

When mode is **Code Review** and file count is ≤5, use @review directly.

### Steps

1. Gather context: diff stat, full diff, linter output, plan context.

2. Invoke @review with Pass 1 (correctness and completeness):

   ```
   You are reviewing CODE CHANGES for correctness and completeness.

   **Git Range:** <baseline>..HEAD
   **Changed Files:**
   {git diff --stat output}

   **Plan Context (if available):**
   {plan content or "No plan context found"}

   Evaluate: issue resolution, requirement coverage, success criteria,
   scope fidelity, edge cases, and integration. Report findings.
   If no plan context: Note "Plan context not found - correctness review
   based on observable code behavior only"
   ```

3. Invoke @review with Pass 2 (quality):

   ```
   You are reviewing CODE CHANGES for quality.

   **Git Range:** <baseline>..HEAD
   **Changed Files:**
   {git diff --stat output}

   **Full Diff:**
   {git diff output}

   **Linter Output:**
   {linter output or "No issues found"}

   Evaluate: codebase patterns, language best practices, linting and
   formatting, security, performance, and documentation. Report findings.
   ```

4. Present unified output format.

## Code Review Flow — Deep Path (6+ files)

When mode is **Code Review** and file count is 6+ (or files>2 AND dirs>2),
use explore for impact analysis before @review.

### Steps

1. Dispatch explore for impact analysis:

   ```
   task(
     subagent_type="explore",
     load_skills=[],
     description="Impact analysis for code review",
     prompt="Analyze these changed files for review context:
       {list of changed files}
       For each file, find:
       - Direct importers/consumers (who calls this?)
       - Test files that exercise this code
       - Related files in same module
       Return: impact map with file paths and risk assessment.",
     run_in_background=true
   )
   ```

2. While explore runs, gather context: diff stat, full diff, linter output,
   plan context.

3. Collect explore results (wait for background task to complete).

4. Invoke @review with Pass 1, including impact analysis context:

   ```
   You are reviewing CODE CHANGES for correctness and completeness.

   **Git Range:** <baseline>..HEAD
   **Changed Files:**
   {git diff --stat output}

   **Impact Analysis:**
   {explore results — impact map and risk assessment}

   **Plan Context (if available):**
   {plan content or "No plan context found"}

   Evaluate: issue resolution, requirement coverage, success criteria,
   scope fidelity, edge cases, and integration. Pay special attention to
   high-risk areas identified in the impact analysis. Report findings.
   ```

5. Invoke @review with Pass 2 (quality), including impact analysis and
   linter output.

6. **Oracle trigger check** — invoke Oracle ONLY when ALL conditions are met:
   - Changes touch **3+ distinct directories**
   - `git diff <baseline>..HEAD` contains changes to interfaces, types, or
     exports (detected mechanically):

     ```bash
     git diff <baseline>..HEAD | grep -E '^\+.*(interface |type |export )' | head -5
     ```

   If both conditions are met, invoke Oracle:

   ```
   task(
     subagent_type="oracle",
     load_skills=[],
     description="Architecture review for cross-cutting changes",
     prompt="These changes touch {DIR_COUNT} directories and modify
       interfaces/types/exports. Review for architectural concerns:
       {git diff --stat output}
       {matched interface/type/export lines}
       Focus on: API contract stability, dependency direction, and
       separation of concerns.",
     run_in_background=false
   )
   ```

   Append Oracle findings to the unified output as a separate section.

7. Present unified output format.

## Unified Output Format

All routing paths MUST produce output in this format:

```markdown
# Review: {Plan Name | Branch/Commit Range}

**Mode**: Plan Review | Code Review (Fast) | Code Review (Deep)
**Routing**: Momus | @review | explore + @review [+ Oracle]
**Target**: {plan file path | git range}
**Files Changed**: N/A | N files (+X, -Y)
**Plan Context**: {path} | Found in .sisyphus/plans/ | Not found

---

## Findings

{For Plan Review: Momus verdict and findings}
{For Code Review: Pass 1 and Pass 2 findings}
{If Oracle was invoked: Architecture findings}

---

## Summary

| Severity | Count |
|----------|-------|
| Critical | N |
| Important | N |
| Minor | N |

**Recommendation**:
{Based on findings, one of:}
- Fix N critical/important issues directly (if few/simple)
- Create plan to address issues (if many/complex)
- Ready for {execution | integration} (if no blocking issues)
```

## Post-Review Action

Based on findings:

1. **If few/simple issues**: Offer to fix them directly.
2. **If many/complex issues**: Offer to create or update a plan to address
   them.
3. **If no blocking issues**: Indicate ready to proceed.

For code review specifically, if ready, guide to
`finishing-a-development-branch` skill.
