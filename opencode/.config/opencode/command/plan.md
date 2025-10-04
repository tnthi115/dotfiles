---
description: Create a detailed implementation plan
agent: general
model: github-copilot/claude-sonnet-4
subtask: true
---

Create a comprehensive implementation plan for: $ARGUMENTS

**Step 1: Task Classification & Targeted Discovery**

Analyze the request and determine what context is actually needed:

- Is this a new feature, bug fix, refactor, or enhancement?
- What technologies/languages are involved?
- What files/components will likely be affected?

**Step 2: Intelligent Context Discovery**

Analyze the task request to determine relevant context:

- Extract key terms from the task description
- Identify likely technology stack from request
- Use targeted agent calls for specific discovery needs

**Step 3: Agent-Driven Analysis**

Based on task analysis, use appropriate agents:

- `project-discovery`: Understand codebase structure
- `technology-stack-analyzer`: Identify dependencies
- `pattern-recognition`: Find existing code patterns
- `security-auditor`: For security-related tasks

**Step 4: Create Implementation-Ready Plan**

1. **Objective & Success Criteria**
   - Specific, measurable outcomes
   - Definition of done
   - Acceptance criteria

2. **Technical Foundation**
   - Existing code patterns to follow
   - Dependencies and imports needed
   - Configuration requirements

3. **Detailed Implementation Steps**
   - File-by-file changes with specific locations
   - Code snippets/templates where helpful
   - Import statements and dependencies
   - Configuration updates needed

4. **Quality Assurance**
   - Test files to create/modify
   - Linting/formatting commands to run
   - Integration points to verify

5. **Risk Mitigation**
   - Potential breaking changes
   - Rollback procedures
   - Dependencies that might conflict

Save as `[task-name]-implementation-plan.md` with agent-executable details. Do not make any code changes.
