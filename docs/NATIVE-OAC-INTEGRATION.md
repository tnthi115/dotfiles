# Native Agents + OAC Skills Integration

**Summary**: Your native agents (@planner, @executor, @code-reviewer) now have
enhanced capabilities using OAC's `task-management` and `context7` skills.

---

## What Was Enhanced

### @planner (Planning Agent)

**Added**: OAC Task Management Skill

**New Capability**: For complex features (4+ files), create atomic, trackable
subtasks with JSON task breakdowns.

**When to use:**

- Multi-step implementation with dependencies
- Parallelizable work streams
- Need progress tracking across sessions

**How it works:**

```javascript
// After creating a plan, for complex features:
skill(
  name="task-management",
  action="breakdown",
  feature="auth-system",
  plan="reference-to-plan"
)
```

**Benefits:**

- Atomic task tracking
- Dependency management
- Parallel execution awareness
- Progress persistence

---

### @executor (Execution Agent)

**Added**: OAC Context7 + Task Management Skills

**New Capabilities**:

#### 1. Context7 - External Library Documentation

Fetch current documentation for any library instead of relying on outdated
training data.

**When to use:**

- Working with new libraries (React, Next.js, FastAPI, etc.)
- Unsure about API usage
- Library APIs that change frequently

**Example:**

```javascript
skill(
  name="context7",
  library="nextjs",
  query="app router server components"
)
```

**Benefits:**

- Current API documentation
- Latest best practices
- Avoid deprecated patterns
- Real code examples

#### 2. Task Management - Progress Tracking

For plans with associated task JSON files, track progress atomically.

**Commands:**

```bash
# Find eligible tasks (dependencies satisfied)
bash .opencode/skills/task-management/router.sh next [feature]

# Mark task complete
bash .opencode/skills/task-management/router.sh complete <feature> <seq> "summary"

# Check overall status
bash .opencode/skills/task-management/router.sh status [feature]
```

**Benefits:**

- Atomic progress tracking
- Dependency-aware execution
- Resume work across sessions
- Parallel task identification

---

### @code-reviewer (Review Agent)

**Added**: OAC Context7 Skill

**New Capability**: Verify external library API usage is current and correct
during reviews.

**When to use:**

- Reviewing code with new library APIs
- Suspicious API usage that may be deprecated
- Want to verify best practices

**Example:**

```javascript
// During review of Next.js code
skill(
  name="context7",
  library="nextjs",
  query="generateMetadata function"
)
```

**Benefits:**

- Catch outdated API usage
- Verify correct library patterns
- Reduce bugs from deprecated APIs
- Ensure current best practices

---

## Architecture: Native + OAC Hybrid

```text
┌─────────────────────────────────────────────────────────────┐
│                     Native Agents                            │
│  (@planner, @executor, @code-reviewer, @commit, etc.)       │
│                                                              │
│  Model: Copilot (FREE) → High quality, cost-effective       │
└────────────────┬────────────────────────────────────────────┘
                 │
    ┌────────────┼────────────┐
    │            │            │
    ▼            ▼            ▼
┌────────┐  ┌──────────┐  ┌──────────┐
│TaskMgmt│  │Context7  │  │Native    │
│Skill   │  │Skill     │  │Skills    │
└────────┘  └──────────┘  └──────────┘
    │            │            │
    ▼            ▼            ▼
JSON Tasks   Current Docs   TDD, Debug,
Tracking     via API        Review, etc.
```

**Result:**

- Native agents provide **speed and cost efficiency** (Copilot models)
- OAC skills add **structured capabilities** (task tracking, current docs)
- No need to choose — **best of both worlds**

---

## Usage Examples

### Example 1: Complex Feature with Task Tracking

```bash
# 1. Plan the feature
/plan "Build authentication system with JWT, refresh tokens, and role-based access"
→ @planner creates plan
→ @planner uses task-management skill to create JSON tasks

# 2. Execute with progress tracking
/do
→ @executor checks task-management for eligible tasks
→ Executes tasks atomically
→ Marks complete with summaries
→ Resumes work across sessions if needed
```

### Example 2: External Library Integration

```bash
# Working with new library
/do "Integrate Stripe for payments"
→ @executor encounters Stripe API
→ Uses context7 skill to fetch current Stripe docs
→ Implements with current API
→ Avoids deprecated patterns
```

### Example 3: Code Review with API Verification

```bash
/review-code
→ @code-reviewer sees Next.js app router code
→ Uses context7 to verify generateMetadata usage
→ Catches outdated patterns
→ Ensures current best practices
```

---

## Skill Reference

### Task Management Skill

**Location**: `.opencode/skills/task-management/`

**Available Commands:**

```bash
# Show all task statuses
bash .opencode/skills/task-management/router.sh status

# Show specific feature
bash .opencode/skills/task-management/router.sh status my-feature

# Show next eligible tasks
bash .opencode/skills/task-management/router.sh next

# Show parallelizable tasks
bash .opencode/skills/task-management/router.sh parallel

# Show blocked tasks
bash .opencode/skills/task-management/router.sh blocked

# Mark task complete
bash .opencode/skills/task-management/router.sh complete my-feature 01 "Implemented auth controller"

# Validate task files
bash .opencode/skills/task-management/router.sh validate
```

**Full Documentation**: `.opencode/skills/task-management/SKILL.md`

---

### Context7 Skill

**Purpose**: Fetch current documentation for external libraries

**Usage:**

```javascript
skill(
  name="context7",
  library="library-name",
  query="topic or API"
)
```

**Examples:**

```javascript
// React hooks
skill(name="context7", library="react", query="useEffect cleanup")

// Next.js routing
skill(name="context7", library="nextjs", query="app router dynamic routes")

// FastAPI
skill(name="context7", library="fastapi", query="dependency injection")

// Stripe
skill(name="context7", library="stripe", query="payment intents")
```

**Full Documentation**: `.opencode/skills/context7/SKILL.md`

---

## Migration from Pure Native

**Before**: Native agents only

- ✅ Fast, cost-effective
- ❌ No structured task tracking
- ❌ Outdated library knowledge

**After**: Native + OAC Skills

- ✅ Still fast, cost-effective (Copilot models)
- ✅ Structured task tracking when needed
- ✅ Current library documentation
- ✅ Best of both worlds

**No changes required to your workflow** — skills are invoked automatically when
beneficial.

---

## Cost Impact

**No additional cost** — OAC skills are lightweight:

- Task management: Local JSON files, no API calls
- Context7: Single curl request to Context7 API (minimal cost)

**Models remain the same:**

- @planner: Copilot Claude Opus (FREE)
- @executor: Copilot GPT-5.4 (FREE)
- @code-reviewer: Copilot Claude Opus (FREE)

---

## Best Practices

### When to Use Task Management

✅ Complex features (4+ files)
✅ Multi-step with dependencies
✅ Parallelizable work
✅ Long-running tasks across sessions

❌ Simple tasks (< 30 min)
❌ Single file changes
❌ Quick fixes

### When to Use Context7

✅ New/unfamiliar libraries
✅ Library APIs change frequently
✅ Suspicious API usage
✅ Want current best practices

❌ Well-known standard library features
❌ Internal project code
❌ When you already know the API

---

## Troubleshooting

### Task management files not found

Ensure you're in the correct project directory where `.tmp/tasks/` exists.

### Context7 no results

Try different search terms or check library name spelling.

### Skills not invoking

Check that OAC is properly installed:

```bash
ls -la ~/.config/opencode/skills/
```

---

## Summary

Your native agents are now **supercharged with OAC capabilities**:

| Agent | Native Strength | + OAC Enhancement |
|-------|----------------|-------------------|
| @planner | Strategic planning | Task breakdown & tracking |
| @executor | Disciplined execution | Current docs + progress tracking |
| @code-reviewer | Thorough review | API verification |

**Keep using your native workflow** — it's already optimal. The OAC skills add
power without adding cost or complexity.
