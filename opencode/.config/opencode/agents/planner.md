---
description: Strategic planning consultant — interviews first, creates plans, dispatches plan-reviewer
code: planner
mode: subagent
model: github-copilot/claude-opus-4.6
prompt: "{file:../prompts/plan.md}"
---

This agent delegates to the native plan agent with full Prometheus behavior.
See `prompts/plan.md` for the complete planning workflow.
