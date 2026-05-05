# Personal OpenCode Agent Configuration

## Core Engineering Principles

**Code Quality & Security**:

- Defensive programming: validate inputs, handle edge cases, fail fast
- Single responsibility functions (<20 lines), DRY principle, SOLID patterns
- Security-first: sanitize inputs, no hardcoded secrets, OWASP compliance

**Error Handling & Performance**:

- Comprehensive validation with graceful error handling and structured logging
- Algorithmic efficiency (Big O), appropriate data structures, smart caching
- Circuit breaker patterns for external calls, exponential backoff retry logic

**Testing & Architecture**:

- Test pyramid (more unit than integration than E2E), AAA pattern, test
  isolation
- Dependency injection, interface segregation, event-driven loose coupling
- No trailing/leading whitespace, syntax validation, linting before completion

**Documentation Standards**:

- **ALWAYS add docstrings to all functions, classes, and modules**
- Docstrings should describe purpose, parameters, return values, and exceptions
- Use language-appropriate docstring formats (JSDoc, Python docstrings, etc.)
- **Add inline comments ONLY when necessary**:
  - Complex algorithms or non-obvious logic that cannot be simplified
  - Business logic requiring additional context
  - Workarounds for bugs or edge cases
  - Performance optimizations that sacrifice readability
- **Prefer self-documenting code**: descriptive names > comments
- Avoid redundant comments that restate what code already clearly expresses

**LSP & Formatting Integration**:

- **ALWAYS use configured LSP and formatter for the current file type**
- Check `opencode.jsonc` for language-specific LSP servers and formatters
- Before writing/editing files, ensure proper LSP diagnostics are checked
- After editing, ALWAYS run the configured formatter for that file extension
- Run formatters before completing any file edit or write operation
- Validate syntax using LSP before finalizing code changes

**MCP Tool Integration**:

### Tool Selection: Use Native Tools

**Always use native OpenCode tools**:

| Operation | Native Tool |
|-----------|-------------|
| Go to definition | `lsp_goto_definition` |
| Find references | `lsp_find_references` |
| Rename symbol | `lsp_rename` |
| Search patterns | `Grep`, `ast_grep_search` |
| Read files | `Read` |
| Run commands | `Bash` |

### Bash Tool Call Formatting (Azure Compatibility)

When using the Bash tool, the `description` parameter MUST follow these rules
to prevent JSON parsing failures in Azure proxy environments:

- **Maximum 5 words** — e.g., `List files in directory`
- **No trailing periods or punctuation**
- **No newlines or special characters** in the value
- **No quotes or escaped characters** within the description string

Bad: `"Check if the plans directory already exists."` (8 words, has period)
Good: `"List files in config directory"` (5 words, at limit)

**Sequential Thinking MCP**: Use for complex reasoning, chain-of-thought,
multi-step analysis.

**Automatic MCP Tool Usage**: Agents are configured to automatically use MCP
tools without explicit user prompting:

- **sequential-thinking**: ALWAYS use for complex reasoning, planning, and
  multi-step analysis
- **gitlab**: Use for all GitLab operations (MRs, issues, pipelines)
- **atlassian**: Use for JIRA and Confluence integration

**Agent Memory Plugin**: Persistent memory blocks are automatically injected
into the system prompt. Use `memory_list`, `memory_set`, `memory_replace` to
manage memory. Memory survives across sessions and compaction.

## Superpowers Skill Integration

**CRITICAL:** Superpowers skills provide workflow discipline. They are NOT
optional.

### Skill Invocation Protocol

1. **Before ANY task**: Check if a skill applies (even 1% chance → invoke it)
2. **Announce usage**: "I'm using [skill] to [purpose]"
3. **Follow exactly**: Rigid skills (TDD, debugging) must be followed precisely
4. **Don't rationalize**: "Too simple" or "I know this" are red flags

### Key Skills for This Configuration

| Task Type | Required Skill | Purpose |
|-----------|---------------|---------|
| Feature/bugfix | `superpowers:test-driven-development` | RED-GREEN-REFACTOR |
| Debugging | `superpowers:systematic-debugging` | 4-phase root cause analysis |
| Planning | `superpowers:writing-plans` | Bite-sized task breakdown |
| Execution | `superpowers:executing-plans` | Batch execution with checkpoints |
| Completion | `superpowers:verification-before-completion` | Evidence before claims |
| Code review | `superpowers:requesting-code-review` | Structured feedback |

## Native Agent Workflow (New)

This configuration uses **native OpenCode custom agents** derived from
oh-my-openagent prompts. The oh-my-openagent plugin itself is disabled to reduce
runtime overhead and per-request token injection while preserving the high-value
agent behaviors.

### Cost-Optimized Model Architecture

| Layer | Model Provider | Cost | Role |
|-------|---------------|------|------|
| **Primary Agents** (chat/orchestrate) | `f5ai-moonshot/Kimi-K2.6` | $0.60/$3 | Daily driver — handles chat, tool routing, orchestration |
| **Subagents** (heavy lifting) | `github-copilot/*` | **Free** | Planning, implementation, code review, commits |
| **Emergency Fallbacks** | `f5ai-openai/gpt-5` | $1.25/$10 | Only if Kimi + Copilot both fail |

**Why this architecture?**

- Kimi is the cheapest capable model for conversational turns (90% of
  interaction)
- Copilot subagents handle expensive work (planning, coding, review) at zero
  marginal cost
- Eliminates oh-my-openagent's ~500-2000 token per-request injection overhead
- F5AI fallbacks are rarely triggered

### Auto-Delegation Pattern (Primary Agent Behavior)

The `build` and `plan` primary agents are configured as **orchestrators**, not
executors. Their job is to recognize task intent and immediately route to the
appropriate Copilot subagent. This is enforced via the `instructions` array in
`opencode.jsonc` — these instructions are **additive** (appended to the
agent's built-in prompt), not replacements.

| User Intent | Primary Agent Action | Subagent Invoked |
|-------------|---------------------|------------------|
| Plan a feature/fix | Auto triggers `/plan` | `@planner` (Copilot claude-opus-4.6) |
| Implement something | Auto triggers `/do` | `@executor` (Copilot gpt-5.4) |
| Review code | Auto triggers `/review-code` | `@code-reviewer` (Copilot claude-opus-4.6) |
| Commit changes | Auto triggers `@commit` | `@commit` (Copilot claude-haiku-4.5) |
| Git operations | Delegates to `@git-master` | `@git-master` (Copilot claude-haiku-4.5) |

**This ensures:**

- Heavy lifting always runs on Copilot (free)
- Kimi only pays for the single orchestration turn (~$0.002)
- No manual subagent invocation required from the user

### Required Complex-Task Flow

For complex tasks, the workflow enforces:

```text
plan -> native plan review -> Plannotator human approval -> execution -> code review
```

| Stage | Native Agent | Model | Purpose |
|-------|-------------|-------|---------|
| Planning | `@planner` | `github-copilot/claude-opus-4.6` | Write implementation plans |
| Plan critique | `@plan-reviewer` | `github-copilot/gpt-5.4` | Critique plans before approval |
| Execution | `@executor` | `github-copilot/gpt-5.4` | Execute approved plans |
| Final review | `@code-reviewer` | `github-copilot/claude-opus-4.6` | Structured code review |

### Native Agents

| Agent | Model | Purpose | Invocation |
|-------|-------|---------|------------|
| `@planner` | `github-copilot/claude-opus-4.6` | Write implementation plans with problem framing | `/plan` or `@planner` |
| `@plan-reviewer` | `github-copilot/gpt-5.4` | Critique plans for executability and gaps | Built into `/plan` flow |
| `@executor` | `github-copilot/gpt-5.4` | Execute approved plans with verification | `/do` or `@executor` |
| `@code-reviewer` | `github-copilot/claude-opus-4.6` | Structured code review with findings-first output | `/review-code` or `@code-reviewer` |
| `@commit` | `github-copilot/claude-haiku-4.5` | Conventional commit generation from diffs | `@commit` |
| `@git-master` | `github-copilot/claude-haiku-4.5` | Git operations, atomic commits, rebasing | `@git-master` |
| `@docs-writer` | (default) | Automated documentation generation and maintenance | `@docs-writer` |

### OAC Agents (OpenAgentsControl)

**Purpose**: Enhanced agents with automatic discovery, external documentation,
and parallel execution

| Agent | Model | Purpose | When to Use |
|-------|-------|---------|-------------|
| **OpenAgent** | `f5ai-moonshot/Kimi-K2.6` | Universal agent with discovery | New codebases, complex discovery |
| **OpenCoder** | `github-copilot/gpt-5.4` | Coding specialist with coordination | Complex features, parallel execution |
| **TaskManager** | `github-copilot/claude-opus-4.6` | Task breakdown and planning | Complex features (4+ files) |
| **CoderAgent** | `github-copilot/gpt-5.4` | Code implementation | All coding tasks |
| **ContextScout** | `f5ai-moonshot/Kimi-K2.6` | Automatic context discovery | Before any implementation |
| **ExternalScout** | `f5ai-moonshot/Kimi-K2.6` | External documentation fetch | External libraries/APIs |
| **BatchExecutor** | `github-copilot/gpt-5.4` | Parallel task coordination | 5+ parallel tasks |
| **Reviewer** | `github-copilot/claude-opus-4.6` | Code review | Pattern-based reviews |
| **TestEngineer** | `github-copilot/gpt-5.4` | Test writing | TDD workflows |
| **BuildAgent** | `github-copilot/gpt-5.3-codex` | Build validation | Type checking, linting |

**OAC Commands**:

- `/add-context` — Interactive context wizard
- `/analyze-patterns` — Pattern analysis
- `/commit` — Smart git commits

**Primary Agent Configuration:** `opencode.jsonc` configures `build` and `plan`
categories with `f5ai-moonshot/Kimi-K2.6` as the daily driver. All heavy lifting
is delegated to Copilot subagents via slash commands.

### Fallback Chain (Emergency Only)

If the primary agent fails, the fallback chain resolves in order:

1. `github-copilot/gpt-5.4` (free)
2. `f5ai-openai/gpt-5` ($1.25/$10)
3. `codeburro-qwen/qwen-3.6` (free)

Under normal usage, you should never hit F5AI fallbacks.

### Legacy Oh-My-OpenCode Agents (Dormant)

The following agents are defined in `oh-my-openagent.jsonc` for reference but
are not active since the plugin is disabled:

- `explore` - Codebase investigation
- `librarian` - External documentation
- `oracle` - Architecture consultation
- `prometheus` - Strategic planning
- `sisyphus` - Task execution
- `metis` - Plan gap analyzer
- `momus` - Ruthless reviewer
- `atlas` - Todo orchestration
- `hephaestus` - Autonomous deep worker

The native agents intentionally preserve exact high-value prompt text from
oh-my-openagent where behavior quality depends on it. Only infrastructure-
dependent sections are removed or adapted.

### Workflow Decision Guide

```text
Need to plan something?
└── /plan or @planner (equivalent — interview-first, auto-saves plan, dispatches plan-reviewer)

Need to execute a plan?
├── Approved plan exists? → /do (native executor agent)
└── Need to plan first? → /plan first, then /do

Need code review?
├── After implementation → /review-code (native code-reviewer agent)

Need to commit?
├── Use @commit agent
└── ALWAYS use verification-before-completion skill

Need code intelligence?
├── Use native lsp_* tools (lsp_goto_definition, lsp_find_references, lsp_rename)
└── Use Grep, ast_grep_search for pattern matching
```

### Native Workflow Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/plan` | Native plan agent with Prometheus prompt | Interview-first planning, auto-saves to `.opencode/plans/`, dispatches plan-reviewer |
| `/do` | `@executor` | Execute approved plans |
| `/review-code` | `@code-reviewer` | Final code review stage |

**Anti-Patterns to Avoid**:

- God objects, magic numbers/strings, copy-paste programming, tight coupling
- Over-engineering (YAGNI), global state, ignoring error conditions

**Technology Selection**: Prefer established solutions, minimal dependencies,
lock files

**Priority Matrix**: 🔴 CRITICAL: Security/validation/formatting 🟡 PRODUCTION:
Testing/docs 🟢 SCALING: Performance 🔵 FUTURE: Experimental

## Scale-Appropriate Engineering

- **🚀 SIMPLE/MVP**: Speed > Architecture. Basic validation, clear code, avoid
  over-engineering
- **📈 PRODUCTION**: Maintainability > Performance. Comprehensive testing,
  security, monitoring, docs
- **🏢 ENTERPRISE**: Reliability > Velocity. Full compliance, observability,
  scalable patterns

### Trade-Off Decision Framework

- **Performance vs Maintainability**: Accept complexity only for critical path
  optimizations
- **Security vs Usability**: High-security domains justify user friction
- **Scalability vs Simplicity**: Start simple with clear scaling path unless
  scale is known
- **Domain-Specific Requirements**: Consider compliance, privacy, availability,
  resource constraints

## Technology Selection Guidelines

- **Performance Requirements**: Choose based on latency, throughput, resource
  constraints
- **Development Velocity**: Balance rapid development with long-term
  maintainability
- **Team Expertise**: Consider familiarity and learning curve
- **Ecosystem Maturity**: Evaluate community support, documentation, stability
- **Prefer Established Solutions**: Use standard libraries, well-established
  FOSS first
- **Minimal Dependencies**: Add dependencies judiciously, use lock files,
  security scanning

## Implementation Priority Matrix

🔴 **CRITICAL**: Input validation, error handling, security basics, formatting,
core testing 🟡 **PRODUCTION**: Comprehensive tests, security auditing,
monitoring, documentation 🟢 **SCALING**: Advanced caching, microservices
patterns, performance optimization 🔵 **FUTURE**: Advanced optimization,
experimental tech, complex patterns (as needed)

## Workflow Preferences

- Explain reasoning before suggesting solutions
- When debugging, trace through code execution path
- For complex tasks, outline approach first
- Show alternatives for non-trivial decisions

## Git and Commit Practices

- **NEVER commit without explicit user permission**
- Only commit when user explicitly requests (e.g., "@commit" agent)
- Focus on implementation and testing, not committing
- User controls when and how commits are made

### Plan File Exclusions (NEVER Commit)

**NEVER stage or commit files from these directories** — they are temporary
working documents, not version-controlled:

| Directory/Pattern | Purpose |
|-------------------|---------|
| `.sisyphus/` | Legacy plans, notepads, drafts (historical) |
| `.opencode/plans/` | OpenCode plan files |
| `*-plan.md`, `plan.md` | Any plan file pattern |

If these files appear in staged changes, **unstage them immediately**:

```bash
git reset HEAD .sisyphus/ .opencode/plans/
git reset HEAD "*-plan.md"
```

These paths are already in `.gitignore`, but agents must actively avoid
staging them.

## Planning Requirements

- **When asked for plan, create markdown document with detailed plan**
- Save as `.opencode/plans/[task-name]-plan.md` in current project repository
- **ALWAYS save plan files to `.opencode/plans/` directory** (git-ignored,
  created automatically if needed)
- Include: objectives, step-by-step breakdown, dependencies, success criteria
- Plans should be optimized for coding agent implementation
- **Default behavior for planning agents: create plan document in `.opencode/plans/`**
- Plan files are temporary working documents and excluded from version control

### Prompt Preservation Policy

The native custom agents intentionally preserve exact high-value prompt text
from oh-my-openagent where behavior quality depends on it. Only infrastructure-
dependent sections are removed or adapted.

### Dormant Reference File

The `oh-my-openagent.jsonc` file is kept for reference and possible future
reuse. The oh-my-openagent plugin itself remains disabled in `opencode.jsonc`.

## Context Preservation & Memory Management

**Compaction is unavoidable in long/complex sessions.**

### Compaction Configuration

| System | Config Location | Purpose |
|--------|-----------------|---------|
| **OpenCode Native** | `opencode.jsonc` → `compaction` | Core auto-compaction when context fills |

The `opencode.jsonc` configuration handles context compaction automatically.

### Agent Memory Plugin

The `opencode-agent-memory` plugin provides persistent, self-editable memory
blocks that survive sessions and compaction. Memory is automatically injected
into the system prompt.

**Default memory blocks:**

- `persona.md` — How the agent should behave (global)
- `human.md` — Your preferences and constraints (global)
- `project.md` — Codebase-specific knowledge (per-project)

**Memory tools:**

- `memory_list` — List available memory blocks
- `memory_set` — Create or update a memory block
- `memory_replace` — Replace text within a memory block

**Memory locations:**

- Global: `~/.config/opencode/memory/*.md`
- Project: `.opencode/memory/*.md` (auto-gitignored)

**Best practice:** Actively maintain memory blocks with important context,
preferences, and learnings. The agent can read and edit its own memory.
