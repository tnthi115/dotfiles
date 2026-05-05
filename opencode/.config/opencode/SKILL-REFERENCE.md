# Skill Reference Guide

## Complete Skill Inventory

### Process Skills (Use First)

| Skill | Purpose | When to Invoke |
|-------|---------|----------------|
| **brainstorming** | Creative work exploration | Before any feature/component design |
| **systematic-debugging** | Root cause analysis | Any bug, test failure, unexpected behavior |
| **test-driven-development** | TDD workflow | ALL features and bugfixes |
| **writing-plans** | Plan creation | Multi-step tasks, complex features |
| **executing-plans** | Plan execution | Approved implementation plans |
| **verification-before-completion** | Pre-completion checks | Before claiming work is done |
| **requesting-code-review** | Structured review | After completing major work |
| **receiving-code-review** | Implementing feedback | When review feedback received |

### Domain Skills

| Skill | Purpose | When to Invoke |
|-------|---------|----------------|
| **task-management** | Break down complex features | 4+ files, multi-step dependencies |
| **context7** | External library documentation | Using external packages/APIs |
| **using-git-worktrees** | Isolated feature work | Before starting major features |
| **finishing-a-development-branch** | Completion workflow | When work is complete |

### Skill Invocation Syntax

```javascript
// Basic invocation
skill(name="skill-name")

// With parameters
skill(name="task-management", action="breakdown", feature="auth-system")
skill(name="context7", library="react", version="18")
skill(name="systematic-debugging", problem="intermittent test failure")
```

---

## Skill-Agent Compatibility

### Native Agents

| Agent | Recommended Skills |
|-------|-------------------|
| @planner | brainstorming, writing-plans, task-management |
| @executor | executing-plans, tdd, debugging, verification |
| @code-reviewer | requesting-code-review |
| @commit | verification-before-completion |
| @docs-writer | context7 |

### OAC Agents

| Agent | Recommended Skills |
|-------|-------------------|
| OpenAgent | brainstorming, writing-plans, task-management, debugging |
| OpenCoder | tdd, debugging, verification, code-review, context7 |
| TaskManager | (built-in task management) |
| CoderAgent | tdd, debugging |
| ContextScout | (built-in discovery) |
| Reviewer | requesting-code-review |
| TestEngineer | tdd |

---

## Skill Priority Order

When multiple skills apply:

1. **Process skills first** (determine HOW)
2. **Domain skills second** (determine WHAT)

**Example:**

- Building a feature → brainstorming first, then task-management
- Fixing a bug → debugging first, then tdd
- Complex implementation → writing-plans first, then executing-plans

---

## Red Flags (ALWAYS Use Skills)

| Thought | Reality |
|---------|---------|
| "This is just a simple question" | Questions are tasks. Check for skills. |
| "I need more context first" | Skill check comes BEFORE clarifying questions. |
| "Let me explore the codebase first" | Skills tell you HOW to explore. Check first. |
| "This doesn't need a formal skill" | If a skill exists, use it. |
| "I remember this skill" | Skills evolve. Read current version. |
| "I'll just do this one thing first" | Check BEFORE doing anything. |

---

## Quick Reference

### Before Starting ANY Task

```text
□ Is this creative work? → brainstorming
□ Is this a bug? → systematic-debugging
□ Is this a feature? → test-driven-development
□ Is this complex (4+ files)? → task-management
□ Does it use external libraries? → context7
□ Is this a plan to execute? → executing-plans
□ Is this work complete? → verification-before-completion
```

---

**Remember**: Skills provide workflow discipline. They are NOT optional.
