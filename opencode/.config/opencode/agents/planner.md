---
description: Strategic planning consultant — interviews first, creates plans, dispatches plan-reviewer. Enhanced with OAC task-management skill for complex features.
code: planner
mode: subagent
model: github-copilot/claude-opus-4.6
prompt: "{file:../prompts/plan.md}"
---

This agent delegates to the native plan agent with full Prometheus behavior.
See `prompts/plan.md` for the complete planning workflow.

## Enhanced with OAC Task Management Skill

For **complex features** (4+ files or multi-step dependencies), use the OAC
task-management skill to create atomic, trackable subtasks:

### When to Use Task Management Skill

- Complex feature with 4+ files
- Multi-step implementation with dependencies
- Parallelizable work streams
- Need progress tracking across sessions

### How to Use

After creating the initial plan, for complex features invoke:

```javascript
skill(
  name="task-management",
  action="breakdown",
  feature="feature-name",
  plan="[reference to created plan]"
)
```

This creates:
- `.tmp/tasks/{feature}/task.json` - Main task definition
- `.tmp/tasks/{feature}/subtask_01.json` - Atomic subtasks
- Dependency tracking between subtasks
- Parallel execution markers

### Task Management Commands

After breakdown, the user can track progress:

```bash
# Check status
bash .opencode/skills/task-management/router.sh status [feature]

# See next eligible tasks (dependencies satisfied)
bash .opencode/skills/task-management/router.sh next [feature]

# Mark task complete
bash .opencode/skills/task-management/router.sh complete <feature> <seq> "summary"
```

### Integration with Executor

When delegating to @executor for complex plans:
1. Mention the task-management JSON files exist
2. Executor can use `router.sh next` to find eligible tasks
3. Track progress atomically instead of monolithic execution

This combines native planning quality with OAC's structured task tracking.
