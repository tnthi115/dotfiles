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

## Oh-My-OpenAgent Architecture (Active)

oh-my-openagent is now the primary orchestration layer. All planning, execution,
and review flows route through Sisyphus and its specialist subagents.

### Cost-Optimized Model Architecture

| Layer | Model Provider | Cost | Role |
|-------|---------------|------|------|
| **Primary Orchestrator** | `f5ai-moonshot/Kimi-K2.6` | $0.60/$3 | Sisyphus/Atlas/Prometheus — orchestration only |
| **Specialist Subagents** | `github-copilot/*` | Subagent calls don't consume premium requests | Hephaestus, Oracle, Momus, Metis, Librarian, Explore |
| **Emergency Fallbacks** | `f5ai-moonshot/Kimi-K2.5` or `github-copilot/*` | Varies | Only if primary fails |

**Why this architecture?**

- Kimi K2.6 is the cheapest capable model for conversational turns (~90% of
  interaction)
- Copilot subagents handle expensive work (planning, coding, review) at zero
  marginal cost
- oh-my-openagent's category system auto-routes to the right model family
- Background task concurrency is minimized to prevent accidental token burn

### Agent Delegation Pattern

| User Intent | Primary Agent | Model | Subagents Invoked |
|-------------|--------------|-------|-------------------|
| Complex task / `ultrawork` | Sisyphus | Kimi K2.6 | Hephaestus, Oracle, Librarian, Explore (parallel) |
| Plan a feature | Prometheus | Kimi K2.6 | Metis (plan review) |
| Execute plan | Sisyphus | Kimi K2.6 | Category-selected specialists |
| Review code | Momus | Copilot GPT-5.4 | — |
| Debug architecture | Oracle | Copilot GPT-5.4 | — |
| Grep codebase | Explore | Copilot Haiku | — |
| Git operations | Git Master (skill) | Copilot Haiku | — |

### Workflow Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `ultrawork` / `ulw` | Sisyphus | Autonomous execution with full orchestration |
| `/start-work` | Prometheus | Interview-driven planning before execution |
| `/init-deep` | — | Generate hierarchical AGENTS.md files |
| `/ralph-loop` | Sisyphus | Self-referential loop until completion |
| `/review-code` | Momus | Ruthless code review |

### Background Tasks vs Subagents

**Preference: Explicit subagent calls over background tasks.**

oh-my-openagent's `task()` tool can run agents in parallel via background tasks.
However, background tasks consume tokens from the orchestrator model (Kimi).
To minimize costs:

1. **Sisyphus explicitly delegates** to @executor, @planner, @code-reviewer via
   native OpenCode subagents when possible
2. **Category routing** sends specialist work to Copilot models automatically
3. **Background concurrency** is capped at 2 global / 5 Copilot to prevent
   runaway usage
4. **Subagent calls** via `@agent` do not count against background task
   concurrency

### Legacy Native Agents (Dormant)

The following native OpenCode agents were previously configured in
`opencode.jsonc` but have been commented out to avoid duplication with
oh-my-openagent:

- `build` (native, commented out) → Replaced by Sisyphus
- `plan` (native, commented out) → Replaced by Prometheus

Native agents `@commit` and `@git-master` remain available for explicit
invocation.

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
- **Default behavior for planning agents:** create plan document in
  `.opencode/plans/`
- Plan files are temporary working documents and excluded from version control

### Prompt Preservation Policy

The native custom agents intentionally preserve exact high-value prompt text
from oh-my-openagent where behavior quality depends on it. Only infrastructure-
dependent sections are removed or adapted.

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
