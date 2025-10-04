---
description: Execute an implementation plan with build agent. Use `/do` for session plan or `/do @plan-file.md` for specific plan file.
agent: build
model: github-copilot/gpt-4.1
subtask: false
---

Execute the implementation plan from session context or specified plan file.

**Step 1: Plan Analysis**

- Use plan from file context (if @ file provided) or session conversation
- Identify targets, dependencies, and code patterns

**Step 2: Implementation**

- Read target files, apply changes following existing patterns
- Run linters/formatters and tests after each change
- Validate imports and dependencies

**Step 3: Validation**

- Run quality gates and complete test suite
- Generate execution summary

**Guidelines:**

- Use Read tool for context
- Follow code patterns and validate incrementally
- If errors occur, analyze and document before proceeding
