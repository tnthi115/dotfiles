---
description: Create an implementation plan with native planner agent. Plans are reviewed and prepared for Plannotator approval.
agent: planner
subtask: true
---

## When to Use This Command

**Use `/plan` when:**

- You have clear requirements and want a technical implementation plan
- You need comprehensive planning before execution
- You want the plan reviewed before human approval

## Required Workflow

The `/plan` command follows this workflow:

```text
/plan -> plan-reviewer -> Plannotator -> /do -> /review-code
```

1. **planner** agent writes the plan
2. **plan-reviewer** agent critiques it for executability
3. **Plannotator** provides human review and approval
4. **executor** agent executes via `/do`
5. **code-reviewer** agent performs final review via `/review-code`

## Required Skills

**REQUIRED:** Use `superpowers:writing-plans` for bite-sized task structure.

**NOTE:** Save plans to `.opencode/plans/[task-name]-plan.md` (not
`.sisyphus/plans/`).

Plans are ephemeral working documents (git-ignored) for agent execution.

---

Create a comprehensive, agent-executable implementation plan for: $ARGUMENTS

This plan will be written by the native `planner` agent and reviewed by the
`plan-reviewer` agent before Plannotator human approval.

## Planning Requirements

### Phase 0: Intent Classification (MANDATORY)

Before planning, classify the work intent:

**Intent Types:**

- **Refactoring**: Changes to existing code - focus on safety
- **Build from Scratch**: New features/modules - focus on discovery
- **Mid-sized Task**: Scoped, bounded work - focus on guardrails
- **Collaborative**: Needs dialogue - focus on incremental clarity
- **Architecture**: System design - focus on strategic decisions
- **Research**: Investigation needed - focus on exit criteria

### Phase 1: Problem Framing

Define:

- What problem are we solving?
- What are the constraints?
- What does success look like?
- What is explicitly out of scope?

### Phase 2: Plan Structure

Every plan MUST include:

1. **Goal**: One sentence describing what this builds
2. **Architecture**: 2-3 sentences about approach
3. **Tech Stack**: Key technologies/libraries
4. **File Map**: Which files will be created or modified
5. **Task Breakdown**: Bite-sized tasks with exact steps
6. **Acceptance Criteria**: How we know it's done
7. **Verification**: QA scenarios for each deliverable

### Phase 3: Task Granularity

**Each step is one action (2-5 minutes):**

- Write the failing test
- Run it to make sure it fails
- Implement the minimal code to make the test pass
- Run tests to verify they pass
- Commit

## Output Requirements

- Use checkbox (`- [ ]`) syntax for tracking
- Exact file paths always
- Complete code in every step
- Exact commands with expected output
- DRY, YAGNI, TDD, frequent commits

## Plan Output Location

Save plans to: `.opencode/plans/[task-name]-plan.md`

Plans are ephemeral working documents (git-ignored) for agent execution.

## Agent Handoff

**CRITICAL: Do not execute the plan yourself.**

After writing the plan:

1. Hand off to the native `plan-reviewer` agent for critique
2. The plan must be ready for human review in Plannotator
3. Stop after the plan is ready for review

`/plan creates a plan, has it reviewed by the native plan-reviewer agent, and prepares it for Plannotator approval. It does not execute the plan.`
