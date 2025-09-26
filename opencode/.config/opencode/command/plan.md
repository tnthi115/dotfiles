---
description: Create a detailed implementation plan
agent: plan
model: github-copilot/claude-sonnet-4
---

Create a comprehensive implementation plan for: $ARGUMENTS

Analyze the current project structure and requirements:
!`find . -type f -name "*.md" -o -name "*.json" -o -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" | head -20`

Current git status:
!`git status --porcelain`

Recent commits for context:
!`git log --oneline -5`

Based on this analysis, create a detailed plan that includes:

1. **Objective & Scope**
   - Clear problem statement
   - Success criteria
   - Scope boundaries

2. **Technical Analysis**
   - Current state assessment
   - Dependencies and constraints
   - Technology stack considerations

3. **Implementation Strategy**
   - Step-by-step breakdown
   - Timeline estimates
   - Risk assessment

4. **Validation Plan**
   - Testing approach
   - Quality gates
   - Rollback strategy

Save the plan as a markdown document with a descriptive filename based on the requested feature or task.