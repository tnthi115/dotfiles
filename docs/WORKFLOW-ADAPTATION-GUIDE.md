# Workflow Adaptation Guide: Native → OAC Hybrid

Your current workflow is **cost-optimized and efficient**. OAC adds structure
and control. This guide shows you how to combine the best of both.

---

## Your Current Native Workflow (What You Have)

```text
User Request
    ↓
Kimi (Primary Agent) — $0.60/$3, cheap orchestration
    ↓ (Auto-delegation)
Copilot Subagents — FREE, heavy lifting
    ↓
Output
```

### Current Commands

| Intent | Command | Agent | Cost |
|--------|---------|-------|------|
| Plan feature | `/plan` | @planner (Copilot) | FREE |
| Execute plan | `/do` | @executor (Copilot) | FREE |
| Review code | `/review-code` | @code-reviewer (Copilot) | FREE |
| Commit | `@commit` | @commit (Copilot) | FREE |

**Your Edge:** Almost everything runs on free Copilot subagents. Kimi only
handles the routing.

---

## OAC Workflow (What's New)

```text
User Request
    ↓
OpenAgent (6-Stage Workflow)
    ├── 1. Analyze — Is this exec or conversational?
    ├── 2. Discover — ContextScout finds patterns
    ├── 3. Approve — MUST approve before any action
    ├── 4. Execute — Load context, delegate or direct
    ├── 5. Validate — Check quality, never auto-fix
    └── 6. Confirm — Summarize, ask if satisfied
```

### Key Differences

| Aspect | Native (Current) | OAC (New) |
|--------|-----------------|-----------|
| **Control** | Can be autonomous | Always requires approval |
| **Context Discovery** | AGENTS.md static | ContextScout dynamic discovery |
| **Approval Gates** | At plan boundaries | At EVERY file write/command |
| **Subagents** | Explicit (@planner, @executor) | Delegated by TaskManager/CoderAgent |
| **Speed** | Fast, parallel capable | Sequential, approval-heavy |
| **Token Injection** | ~500-2000 per request (native agents) | Comparable (OAC agents as markdown) |

---

## Recommended Hybrid Workflow

Don't replace — **augment selectively**.

### When to Use Native Agents (Keep Current)

| Scenario | Why Native? | Command |
|----------|-------------|---------|
| **Quick tasks** (< 30 min, 1-3 files) | Speed matters, less overhead | `/do` with native @executor |
| **Familiar codebase** | You know the patterns, don't need discovery | Native @planner |
| **Emergency fixes** | Need speed, can skip some gates | Native workflow |
| **Git operations** | @git-master is reliable | `@git-master` |
| **Documentation** | @docs-writer works well | `@docs-writer` |

### When to Use OAC (Switch to OpenAgent)

| Scenario | Why OAC? | Command |
|----------|----------|---------|
| **New/unfamiliar project** | ContextScout discovers patterns automatically | `opencode --agent OpenAgent` |
| **Complex multi-file features** | TaskManager breaks down and coordinates | OpenAgent → delegates to TaskManager |
| **Need pattern enforcement** | OAC loads standards from context/ automatically | OpenAgent (enforces MVI) |
| **Learning/exploring** | Approval gates prevent mistakes | OpenAgent (safe mode) |
| **External library integration** | ExternalScout fetches current docs | OpenAgent + ExternalScout |

---

## Optimized Workflow Patterns

### Pattern 1: Quick Native Tasks (Keep as-is)

```bash
# You're in a familiar repo, need a quick fix
opencode  # Uses native build agent

"Add error handling to the auth middleware"
→ /plan  # Native @planner, interview style
→ Plannotator review
→ /do    # Native @executor, fast execution
→ /review-code  # Native @code-reviewer
```

### Pattern 2: Complex/New Work (Use OAC)

```bash
# New project or complex feature
opencode --agent OpenAgent

"Build a user authentication system with JWT"
→ OpenAgent analyzes → discovers it's complex
→ ContextScout scans project for patterns
→ TaskManager breaks into subtasks
→ **Approval required** for each step
→ CoderAgent implements with pattern matching
→ Validation before completion
```

### Pattern 3: External Library Setup (Use OAC ExternalScout)

```bash
opencode --agent OpenAgent

"Integrate Stripe for payments"
→ OpenAgent detects external library
→ ExternalScout fetches current Stripe docs
→ ContextScout finds your API patterns
→ Implements with current Stripe API + your patterns
```

### Pattern 4: Git Operations (Keep Native)

```bash
# Git operations — native is faster
@git-master  # Or just use git commands
```

---

## Command Decision Matrix

| You Want To... | Use This | Why |
|----------------|----------|-----|
| **Plan a feature** | `/plan` (native) | Interview-first, Plannotator integration, FREE |
| **Plan in unfamiliar codebase** | `OpenAgent` → `/add-context` first | ContextScout learns patterns first |
| **Execute approved plan** | `/do` (native) | Fast, Copilot @executor is FREE |
| **Execute complex multi-step** | `OpenAgent` | TaskManager coordinates subagents |
| **Review code** | `/review-code` (native) | Structured, findings-first, FREE |
| **Quick commit message** | `@commit` (native) | Fast, conventional format |
| **Smart commit with context** | `OpenAgent` → `/commit` | OAC may have better context awareness |
| **Git rebase/operations** | `@git-master` | Reliable, FREE |
| **Generate docs** | `@docs-writer` | Works well, FREE |
| **Answer questions** | Default (Kimi) | Cheapest, no need for agents |
| **Debug with systematic approach** | `OpenAgent` + debugging skill | Structured 4-phase debugging |
| **Explore unfamiliar codebase** | `OpenAgent` | ContextScout discovers structure |

---

## Day-to-Day Workflow Examples

### Example 1: Morning Standup Tasks

```bash
# Quick fixes in familiar repo — native is faster
opencode

"Fix the null pointer in user service"
→ /plan (native) — quick plan
→ /do (native) — quick fix
→ /review-code — quick review
→ @commit — commit
```

### Example 2: Afternoon Feature Work

```bash
# New feature in complex codebase — OAC shines
opencode --agent OpenAgent

"Add caching layer with Redis"
→ OpenAgent analyzes complexity
→ ContextScout discovers existing caching patterns
→ ExternalScout fetches Redis best practices
→ TaskManager breaks into: config, client, integration tests
→ **You approve each step**
→ CoderAgent implements matching your patterns
→ Validation gates ensure quality
```

### Example 3: Code Review Session

```bash
# Review PR — native is structured and fast
/review-code

# Or ask OAC for pattern-based review
opencode --agent OpenAgent
"Review this PR against our coding standards"
→ OpenAgent loads standards/code-quality.md
→ Reviews with pattern enforcement
```

---

## Key Optimizations

### 1. Keep Cost Structure

Your current setup is **already optimal for cost**:

- Kimi ($0.60/$3) for orchestration — cheap
- Copilot (FREE) for execution — perfect

OAC doesn't change this — agents are markdown files, same injection cost.

### 2. Use ContextScout for Discovery

Before any complex task in a new codebase:

```bash
opencode --agent OpenAgent
/add-context  # Interactive wizard, ~10 min
# Now OpenAgent knows your patterns
```

### 3. Preserve Speed for Known Work

Don't use OAC for:

- Quick fixes in familiar code
- Git operations
- Simple documentation
- Repetitive tasks

Use OAC for:

- Discovery and learning
- Complex coordination
- Pattern enforcement
- External library integration

### 4. Hybrid Agent Invocation

You can even mix within a session:

```bash
# Start with OAC for discovery
opencode --agent OpenAgent
"Explain this codebase structure"
→ ContextScout analyzes

# Then switch to native for execution
"Now implement feature X based on those patterns"
→ Switch to native /plan + /do
→ Faster execution
```

---

## Migration Path

### Phase 1: Learn OAC (1-2 weeks)

- Use OpenAgent for new/unfamiliar projects
- Use native for daily work in familiar repos
- Compare speed and quality

### Phase 2: Optimize (ongoing)

- Document which workflows benefit from OAC
- Keep native for speed-critical tasks
- Use OAC for quality-critical tasks

### Phase 3: Customize (if needed)

- Adjust OAC context files for your patterns
- Tune native agents for your specific needs
- Find your optimal hybrid balance

---

## Summary: Your Optimized Setup

| Component | Keep | Replace | Notes |
|-----------|------|---------|-------|
| **Native @planner** | ✅ | | For quick planning in familiar code |
| **Native @executor** | ✅ | | For fast execution |
| **Native @code-reviewer** | ✅ | | Structured reviews |
| **Native @commit** | ✅ | | Fast conventional commits |
| **Native @git-master** | ✅ | | Git operations |
| **Native @docs-writer** | ✅ | | Documentation |
| **OAC OpenAgent** | | ✅ | For discovery, complex coordination |
| **OAC OpenCoder** | | ✅ | For production development |
| **ContextScout** | | ✅ | Auto-discovery of patterns |
| **ExternalScout** | | ✅ | Current external library docs |

**Bottom Line:** Use OAC where it adds value (discovery, complex coordination),
keep native where it's already optimal (speed, cost, familiar workflows).
