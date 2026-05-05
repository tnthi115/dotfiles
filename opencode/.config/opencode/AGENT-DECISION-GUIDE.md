# Agent Decision Guide

## Quick Reference: Which Agent to Use?

### Planning Workflows

```text
Need to plan something?
├── Simple task (1-3 files, familiar code)
│   └── /plan → @planner (native, fast, FREE)
├── Complex feature (4+ files, multi-step)
│   ├── Need task tracking? → /plan + task-management skill
│   └── New codebase? → OpenAgent (ContextScout first)
└── Need strategic guidance? → OpenAgent (discovery mode)
```

### Execution Workflows

```text
Need to implement?
├── Quick fix, familiar codebase
│   └── @executor (native, fast, FREE)
├── Complex multi-file feature
│   ├── Need parallel execution? → OpenCoder + BatchExecutor
│   └── Standard execution? → @executor (native)
├── New codebase, need discovery
│   └── OpenCoder (ContextScout → CoderAgent)
├── External libraries involved
│   └── @executor + context7 skill
└── Test-driven development
    ├── Native workflow? → @executor + tdd skill
    └── OAC workflow? → OpenCoder + TestEngineer
```

### Review Workflows

```text
Need code review?
├── Thorough architectural review
│   └── /review-code → @code-reviewer (native, FREE)
├── Quick pattern check
│   └── OAC Reviewer (parallel with other tasks)
└── External library usage check
    └── @code-reviewer + context7 skill
```

### Discovery Workflows

```text
Need to understand codebase?
├── New project exploration
│   └── OpenAgent + ContextScout
├── Find patterns/examples
│   └── ContextScout (discovery)
├── External library docs
│   └── ExternalScout (context7 skill)
└── Quick questions
    └── Default agent (Kimi, cheapest)
```

---

## Decision Matrix

| Scenario | Native | OAC | Recommendation |
|----------|--------|-----|----------------|
| **Simple task** (< 4 files) | ✅ @executor | ❌ | Native (faster) |
| **Complex feature** (4+ files) | ⚡ @executor + task-management | ✅ OpenCoder | Both good |
| **New codebase** | ❌ | ✅ OpenAgent | OAC (discovery) |
| **Familiar codebase** | ✅ @executor | ⚡ OpenCoder | Native (faster) |
| **External libraries** | ✅ @executor + context7 | ⚡ OpenCoder | Either |
| **Parallel execution** | ❌ | ✅ OpenCoder + BatchExecutor | OAC |
| **Strategic planning** | ✅ @planner | ✅ OpenAgent | Both |
| **Code review** | ✅ @code-reviewer | ⚡ Reviewer | Native (thorough) |
| **Documentation** | ✅ @docs-writer | ⚡ DocWriter | Native |
| **Git operations** | ✅ @git-master | ❌ | Native only |
| **Conventional commits** | ✅ @commit | ⚡ /commit | Native (simpler) |

**Legend:**

- ✅ Best choice
- ⚡ Good alternative
- ❌ Not recommended

---

## Cost-Optimized Workflow

### Daily Development (Low Cost)

```text
User Request
    ↓
Kimi (Primary) — $0.60/$3
    ↓
Native Subagent — FREE (Copilot)
    ↓
Result
```

**Typical usage:**

- `/plan` → @planner (FREE)
- `@executor` → @executor (FREE)
- `/review-code` → @code-reviewer (FREE)
- `@commit` → @commit (FREE)

**Cost:** ~$0.002 per interaction

### Complex/New Projects (Higher Quality)

```text
User Request
    ↓
Kimi/OpenAgent — $0.60/$3
    ↓
ContextScout — $0.60/$3 (if needed)
    ↓
TaskManager — FREE (Copilot)
    ↓
CoderAgents — FREE (Copilot, parallel)
    ↓
Result
```

**Typical usage:**

- New codebase → OpenAgent + ContextScout
- Complex feature → OpenCoder + TaskManager + BatchExecutor
- Parallel work → Multiple CoderAgents

**Cost:** ~$0.004-0.01 per complex task

---

## Command Aliases

### Native Commands

```bash
/plan              # Strategic planning (@planner)
/do                # Execute plan (@executor)
/review-code       # Code review (@code-reviewer)
@commit            # Conventional commits
@git-master        # Git operations
@docs-writer       # Documentation
```

### OAC Commands

```bash
/add-context       # Interactive context wizard
/analyze-patterns  # Pattern analysis
/clean             # Cleanup operations
/commit            # Smart git commits (OAC version)
```

### Direct Agent Invocation

```bash
# Native
opencode --agent planner
opencode --agent executor
opencode --agent code-reviewer

# OAC
opencode --agent openagent
opencode --agent opencoder
```

---

## Workflow Examples

### Example 1: Quick Bug Fix

```bash
# 1. Use native executor (fast, familiar code)
@executor

# 2. Inside executor:
#    - skill(name="systematic-debugging")
#    - skill(name="test-driven-development")
#    - Fix bug
#    - skill(name="verification-before-completion")

# 3. Commit
@commit
```

### Example 2: New Feature in Familiar Codebase

```bash
# 1. Plan with native planner
/plan "Add user authentication feature"

# 2. Execute with native executor
/do

# 3. Review
/review-code

# 4. Commit
@commit
```

### Example 3: Complex Feature in New Codebase

```bash
# 1. Use OpenAgent for discovery
opencode --agent openagent

# 2. Inside OpenAgent:
#    - skill(name="context7", library="nextjs")
#    - ContextScout discovers patterns
#    - TaskManager breaks down feature

# 3. Use OpenCoder for implementation
opencode --agent opencoder

# 4. Inside OpenCoder:
#    - BatchExecutor runs parallel CoderAgents
#    - TestEngineer writes tests
#    - skill(name="verification-before-completion")

# 5. Review with native (thorough)
/review-code

# 6. Commit
@commit
```

---

## Anti-Patterns to Avoid

❌ **Don't use OAC for simple tasks** — Native agents are faster
❌ **Don't use native for discovery** — OAC has ContextScout
❌ **Don't skip skills** — They provide discipline
❌ **Don't mix approaches mid-task** — Pick one and stick with it
❌ **Don't forget verification** — Always verify before completion

---

## Remember

- **Native** = Fast, familiar, simple tasks
- **OAC** = Discovery, complex, parallel, new codebases
- **Skills** = Always use them (discipline)
- **Cost** = Most work is FREE (Copilot subagents)

Choose wisely. Execute deliberately. Verify always.
