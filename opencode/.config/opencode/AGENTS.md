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

**Compaction is unavoidable in long/complex sessions.**

**Best Practice:** Use Serena memory for all multi-step or long-running tasks:

- **Start:** Write plan, context, progress, and decisions to memory at task start.
- **During:** After every major step or decision, and before/after risky or long operations, update progress and decisions in memory.
- **After Compaction/Resume:** Immediately re-read all relevant memory files to restore context.

**Memory names:**
- `task_[timestamp]_plan` (plan)
- `task_[timestamp]_context` (requirements)
- `task_[timestamp]_progress` (status)
- `task_[timestamp]_decisions` (decisions)

**Summary:**
- Always update and read memory at key points to prevent context loss.
- This ensures robust, lossless progress even with frequent compaction.
