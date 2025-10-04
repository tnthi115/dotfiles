# Personal OpenCode Agent Configuration

## Core Engineering Principles

### Code Quality Foundation

- **Defensive Programming**: Validate inputs, handle edge cases, fail fast
- **Single Responsibility**: Functions/classes with one clear purpose (typically <20 lines)
- **DRY Principle**: Extract common functionality, avoid code duplication
- **SOLID Principles**: Follow industry-standard OOP design patterns
- **Avoid Deep Nesting**: Use early returns, guard clauses, extraction methods
- **Security First**: Sanitize inputs, use minimal privileges, no hardcoded secrets, OWASP compliance

### Error Handling & Resilience

- **Comprehensive Validation**: Check all parameters, file paths, user inputs
- **Graceful Error Handling**: Use appropriate exception patterns for each language
- **Circuit Breaker Pattern**: Implement for external service calls
- **Retry Logic**: Use exponential backoff with jitter for transient failures
- **Structured Logging**: Include context (request IDs, user IDs, operation details)
- **Timeout Handling**: Set timeouts for all I/O operations

### Performance & Efficiency

- **Algorithmic Efficiency**: Consider time/space complexity (Big O)
- **Appropriate Data Structures**: Use efficient collections for use case
- **Lazy Evaluation**: Load/compute only when needed
- **Memory Management**: Be mindful of allocation and cleanup
- **Caching Strategies**: Implement appropriate caching with proper invalidation

## Architecture & Design Patterns

- **Dependency Injection**: Prefer constructor injection for testability
- **Interface Segregation**: Design small, focused interfaces
- **Event-Driven Architecture**: Use events for loose coupling
- **Repository Pattern**: Abstract data access behind interfaces
- **API Design**: RESTful principles, proper versioning, consistent error responses
- **Database**: Transactions for consistency, connection pooling, schema migrations
- **Data Validation**: Validate at multiple layers (client, API, database)

## Testing & Quality Assurance

- **Test Pyramid**: More unit tests than integration, more integration than E2E
- **AAA Pattern**: Arrange-Act-Assert structure for tests
- **Test Isolation**: Independent tests that don't rely on other tests' state
- **Mock External Dependencies**: Use mocks/stubs for databases, APIs, services
- **Edge Case Coverage**: Test boundary conditions, null/empty inputs, error scenarios
- **No trailing/leading whitespace** in generated files, especially markdown
- **Syntax Validation**: Ensure no syntax errors in generated code
- **Linting & Formatting**: Run language-specific linters/formatters before completion
- **Type Safety**: Use static typing and type hints where available
- **Self-Documenting Code**: Write code that explains intent through naming

## Anti-Patterns to Avoid

- **God Objects**: Avoid classes/modules that do too many things
- **Magic Numbers/Strings**: Use named constants instead of hard-coded values
- **Copy-Paste Programming**: Extract common functionality instead
- **Over-Engineering**: Don't add complexity for theoretical future needs (YAGNI)
- **Global State**: Minimize global variables and shared mutable state
- **Tight Coupling**: Prefer loose coupling via interfaces
- **Ignoring Errors**: Always handle or explicitly acknowledge error conditions

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
