---
description: Create an OpenCode Build Agent optimized implementation plan with comprehensive issue analysis
agent: codebase-analyzer
model: github-copilot/claude-sonnet-4
subtask: true
---

Create a comprehensive, agent-executable implementation plan for: $ARGUMENTS

This plan will be executed by OpenCode's build agent in one pass. Focus on clarity, completeness, and actionable steps.

## Phase 0: Current State Analysis & Issues Identified

**First analyze and document all issues found in the current implementation:**

### Performance Issues

- **Identify Bottlenecks**: Specific performance problems with line references
- **Resource Usage**: Memory leaks, inefficient algorithms, database query issues
- **Scalability Concerns**: Code that won't scale with increased load
- **Quantify Impact**: Expected % improvements with rationale

### Correctness Issues

- **Logic Errors**: Flawed algorithms or business logic with examples
- **Edge Cases**: Unhandled scenarios that could cause failures
- **Data Integrity**: Race conditions, validation gaps, inconsistent states
- **Error Handling**: Missing or inadequate error handling patterns

### Maintainability Issues

- **Code Clarity**: Complex, unreadable, or undocumented code sections
- **Structural Problems**: Tight coupling, violation of SOLID principles
- **Anti-patterns**: God objects, magic numbers, copy-paste programming
- **Technical Debt**: Outdated patterns, deprecated dependencies

### Security Concerns

- **Vulnerabilities**: Potential security holes with severity assessment
- **Input Validation**: Missing sanitization or validation
- **Authentication/Authorization**: Access control issues
- **Data Exposure**: Logging sensitive information, insecure storage

### Code Quality Assessment

- **Style Violations**: Inconsistent formatting, naming conventions
- **Complexity Metrics**: Functions/classes that exceed reasonable complexity
- **Test Coverage**: Missing or inadequate test coverage areas
- **Documentation Gaps**: Missing or outdated documentation

## Phase 1: Context Discovery & Solution Design

**Analyze the codebase and requirements:**

1. **Technology Detection**
   - Scan project files to identify the tech stack
   - Check package.json, requirements.txt, Cargo.toml, go.mod, etc.
   - Note existing patterns, conventions, and project structure

2. **File System Mapping**
   - List all files that need modification (exact paths)
   - Identify new files to create (exact paths)
   - Note any config files that need updates

3. **Dependencies & Environment**
   - Check existing dependencies and versions
   - Identify new dependencies needed
   - Note any environment variables or config changes

### How Each Issue Will Be Addressed

**Issue → Solution Mapping:**

For each issue identified in Phase 0, provide:

- **Current Implementation**: Show the problematic code patterns
- **Proposed Solution**: Specific technical approach to fix the issue
- **Rationale**: Why this approach solves the identified problem
- **Risk Assessment**: What could go wrong and mitigation strategies

**Before/After Code Comparisons:**

- Include concrete code snippets showing current vs. proposed implementations
- Highlight the specific changes that address each identified issue
- Explain the technical reasoning behind each solution choice

## Phase 2: Implementation Design

**Create the technical approach:**

1. **Code Structure**
   - Follow existing code patterns and conventions
   - Use the same import styles, error handling, and naming
   - Match existing test patterns and frameworks
   - Address structural issues identified in Phase 0

2. **Change Breakdown**
   - Break changes into logical, independent steps
   - Each step should be testable on its own
   - Provide exact code for each file change
   - Prioritize changes by impact and risk level

3. **Quality Standards**
   - Use OpenCode's LSP integration for real-time validation
   - Apply configured formatters automatically (no manual commands)
   - Use configured linters for code quality checks
   - Note test commands: `npm test`, `pytest`, `go test ./...`, etc.
   - Implement improvements for issues identified in Phase 0

## Phase 3: Implementation Steps

**For each change, provide:**

1. **File Operations**
   - **Create new files**: Full file path + complete content
   - **Modify existing files**: Exact changes with context
   - **Update configs**: Specific changes to package.json, requirements.txt, etc.
   - **Reference Phase 0 Issues**: Note which specific issues each change addresses

2. **Code Content**
   - Include complete, working code for each file
   - Ensure all imports are correct and available
   - Follow existing code style and patterns exactly
   - Implement fixes for performance, correctness, and maintainability issues

3. **Validation Steps**
   - After each major change, run relevant tests
   - Check linting and formatting
   - Verify the change works as expected
   - Confirm that identified issues are resolved

## Phase 4: Testing & Quality

**Ensure everything works:**

1. **Test Implementation**
   - Create/update unit tests for new functionality
   - Include integration tests if needed
   - Provide complete test code, not just descriptions
   - Add tests specifically for issues fixed in Phase 0

2. **Quality Checks**
   - Use OpenCode's LSP for real-time error detection
   - Apply all configured formatters automatically
   - Run configured linters for code quality validation
   - Execute full test suite
   - Verify security improvements are working

3. **Manual Verification**
   - List specific things to check manually
   - Provide example API calls, UI interactions, etc.
   - Note any edge cases to test
   - Test scenarios that previously failed due to identified issues

## Phase 5: Impact Assessment & Completion Criteria

**Quantify improvements and define success:**

1. **Performance Improvements**
   - Expected % improvements with rationale
   - Benchmark comparisons (before/after metrics)
   - Resource usage improvements
   - Scalability enhancements

2. **Maintainability Gains**
   - How changes improve code clarity and structure
   - Reduced complexity metrics
   - Improved test coverage percentages
   - Documentation improvements

3. **Functional Requirements**
   - List specific behaviors that must work
   - Include example inputs/outputs
   - Note any performance requirements
   - Confirm all identified issues are resolved

4. **Technical Requirements**
   - All tests pass (including new tests for fixed issues)
   - No linting errors
   - Project builds successfully
   - No breaking changes (unless intended)
   - Security vulnerabilities addressed

## Agent Execution Notes

**Save as `[task-name]-plan.md` and ensure:**

- Phase 0 analysis is completed before any implementation begins
- Every file change includes the complete file path and references specific issues being fixed
- All code snippets are complete and runnable
- All commands are exact and ready to execute
- Dependencies are specified with versions when critical
- Before/after comparisons are included for key improvements
- The plan can be executed top-to-bottom without additional context
- Each implementation step clearly states which Phase 0 issues it addresses

The goal is a plan so clear and complete that any build agent can execute it successfully while understanding both the problems being solved and the rationale behind each solution.
