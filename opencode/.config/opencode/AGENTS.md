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

**Sequential Thinking MCP**: Use for complex reasoning, chain-of-thought,
multi-step analysis.

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

### Oh-My-OpenCode Agent Delegation

Use `delegate_task()` for specialized agents:

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| `explore` | Codebase investigation | Finding patterns, understanding structure |
| `librarian` | External documentation | Looking up APIs, best practices |
| `oracle` | Architecture consultation | Major design decisions |
| `prometheus` | Strategic planning | Complex projects needing interview |
| `sisyphus` | Task execution | Implementing plans from Prometheus |

### Workflow Decision Guide

```text
Need to plan something?
├── Clear requirements? → /plan (quick technical plan)
└── Unclear requirements? → Prometheus (consultative interview)

Need to execute a plan?
├── Simple plan? → /do with executing-plans skill
└── Complex multi-session? → /start-work (Sisyphus orchestration)

Need to commit?
├── Use @commit agent
└── ALWAYS use verification-before-completion skill

Need code intelligence?
├── Use native lsp_* tools (lsp_goto_definition, lsp_find_references, lsp_rename)
└── Use Grep, ast_grep_search for pattern matching
```

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

## Planning Requirements

- **When asked for plan, create markdown document with detailed plan**
- Save as `.sisyphus/plans/[task-name]-plan.md` in current project repository
- **ALWAYS save plan files to `.sisyphus/plans/` directory** (git-ignored,
  created automatically if needed)
- Include: objectives, step-by-step breakdown, dependencies, success criteria
- Plans should be optimized for coding agent implementation
- **Default behavior for planning agents: create plan document in `.sisyphus/plans/`**
- Plan files are temporary working documents and excluded from version control

## Context Preservation & Memory Management

**Compaction is unavoidable in long/complex sessions.**

### Compaction Configuration

Two compaction systems work together:

| System | Config Location | Purpose |
|--------|-----------------|---------|
| **OpenCode Native** | `opencode.jsonc` → `compaction` | Core auto-compaction when context fills |
| **oh-my-opencode** | `oh-my-opencode.json` → `experimental` | Aggressive truncation and context pruning strategies |

These are complementary: OpenCode's `compaction.auto` triggers compaction, while
oh-my-opencode's `dynamic_context_pruning` optimizes what gets pruned.

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
