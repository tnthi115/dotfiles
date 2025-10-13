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
- Test pyramid (more unit than integration than E2E), AAA pattern, test isolation
- Dependency injection, interface segregation, event-driven loose coupling
- No trailing/leading whitespace, syntax validation, linting before completion

**Anti-Patterns to Avoid**:
- God objects, magic numbers/strings, copy-paste programming, tight coupling
- Over-engineering (YAGNI), global state, ignoring error conditions

**Technology Selection**: Prefer established solutions, minimal dependencies, lock files

**Priority Matrix**: 🔴 CRITICAL: Security/validation/formatting 🟡 PRODUCTION: Testing/docs 🟢 SCALING: Performance 🔵 FUTURE: Experimental

## Scale-Appropriate Engineering

- **🚀 SIMPLE/MVP**: Speed > Architecture. Basic validation, clear code, avoid over-engineering
- **📈 PRODUCTION**: Maintainability > Performance. Comprehensive testing, security, monitoring, docs
- **🏢 ENTERPRISE**: Reliability > Velocity. Full compliance, observability, scalable patterns

### Trade-Off Decision Framework

- **Performance vs Maintainability**: Accept complexity only for critical path optimizations
- **Security vs Usability**: High-security domains justify user friction
- **Scalability vs Simplicity**: Start simple with clear scaling path unless scale is known
- **Domain-Specific Requirements**: Consider compliance, privacy, availability, resource constraints

## Technology Selection Guidelines

- **Performance Requirements**: Choose based on latency, throughput, resource constraints
- **Development Velocity**: Balance rapid development with long-term maintainability
- **Team Expertise**: Consider familiarity and learning curve
- **Ecosystem Maturity**: Evaluate community support, documentation, stability
- **Prefer Established Solutions**: Use standard libraries, well-established FOSS first
- **Minimal Dependencies**: Add dependencies judiciously, use lock files, security scanning

## Implementation Priority Matrix

🔴 **CRITICAL**: Input validation, error handling, security basics, formatting, core testing
🟡 **PRODUCTION**: Comprehensive tests, security auditing, monitoring, documentation
🟢 **SCALING**: Advanced caching, microservices patterns, performance optimization
🔵 **FUTURE**: Advanced optimization, experimental tech, complex patterns (as needed)

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
- Save as `plan.md` or `[task-name]-plan.md` in current directory
- Include: objectives, step-by-step breakdown, dependencies, success criteria
- Plans should be optimized for coding agent implementation
- **Default behavior for planning agents: create plan document**

## Context Preservation & Memory Management

**Problem**: During long planning or multi-step agent sessions, OpenCode’s compaction cycles can degrade context through repeated summarization, leading to loss of critical details and requirements.

**Solution**: Proactively use Serena’s memory system to preserve planning context and prevent information loss:

### Pre-Planning Memory Setup

When starting complex tasks, immediately create persistent memories:

```bash
serena_write_memory "task_[timestamp]_plan" "[complete original plan]"
serena_write_memory "task_[timestamp]_context" "[requirements and constraints]"
serena_write_memory "task_[timestamp]_progress" "Task initiated - no progress yet"
serena_write_memory "task_[timestamp]_decisions" "Initial decision log"
```

### During Execution Memory Updates

Before potential compaction points, update progress and decisions:

```bash
serena_write_memory "task_[timestamp]_progress" "[current status and next steps]"
serena_write_memory "task_[timestamp]_decisions" "[new decisions and rationale]"
```

### Post-Compaction Context Recovery

After compaction, restore full context by reading all relevant memories:

```bash
serena_read_memory "task_[timestamp]_plan"
serena_read_memory "task_[timestamp]_context"
serena_read_memory "task_[timestamp]_progress"
serena_read_memory "task_[timestamp]_decisions"
```

### Memory Naming Convention

- `task_YYYYMMDD_HHMM_plan` – Original complete plan
- `task_YYYYMMDD_HHMM_context` – Requirements, constraints, background
- `task_YYYYMMDD_HHMM_progress` – Current status, completed/remaining steps
- `task_YYYYMMDD_HHMM_decisions` – Key decisions and rationale

### When to Use the Memory System

- **Always**: For multi-step tasks expected to trigger compaction
- **Planning Phase**: Save complete plan before execution begins
- **Decision Points**: Record significant architectural or approach decisions
- **Progress Checkpoints**: Update status before long-running operations
- **Error Recovery**: Save state before attempting risky operations

This prevents context degradation and ensures plan fidelity throughout execution.
