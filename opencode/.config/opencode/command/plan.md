---
description: Create an OpenCode Build Agent optimized implementation plan
agent: codebase-analyzer
model: github-copilot/claude-sonnet-4
subtask: true
---

Create a comprehensive, agent-executable implementation plan for: $ARGUMENTS

This plan will be executed by OpenCode's build agent in one pass. Focus on clarity, completeness, and actionable steps.

## Phase 1: Context Discovery

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

## Phase 2: Implementation Design

**Create the technical approach:**

1. **Code Structure**
   - Follow existing code patterns and conventions
   - Use the same import styles, error handling, and naming
   - Match existing test patterns and frameworks

2. **Change Breakdown**
   - Break changes into logical, independent steps
   - Each step should be testable on its own
   - Provide exact code for each file change

3. **Quality Standards**
   - Use OpenCode's LSP integration for real-time validation
   - Apply configured formatters automatically (no manual commands)
   - Use configured linters for code quality checks
   - Note test commands: `npm test`, `pytest`, `go test ./...`, etc.

## Phase 3: Implementation Steps

**For each change, provide:**

1. **File Operations**
   - **Create new files**: Full file path + complete content
   - **Modify existing files**: Exact changes with context
   - **Update configs**: Specific changes to package.json, requirements.txt, etc.

2. **Code Content**
   - Include complete, working code for each file
   - Ensure all imports are correct and available
   - Follow existing code style and patterns exactly

3. **Validation Steps**
   - After each major change, run relevant tests
   - Check linting and formatting
   - Verify the change works as expected

## Phase 4: Testing & Quality

**Ensure everything works:**

1. **Test Implementation**
   - Create/update unit tests for new functionality
   - Include integration tests if needed
   - Provide complete test code, not just descriptions

2. **Quality Checks**
   - Use OpenCode's LSP for real-time error detection
   - Apply all configured formatters automatically
   - Run configured linters for code quality validation
   - Execute full test suite

3. **Manual Verification**
   - List specific things to check manually
   - Provide example API calls, UI interactions, etc.
   - Note any edge cases to test

## Phase 5: Completion Criteria

**Define success:**

1. **Functional Requirements**
   - List specific behaviors that must work
   - Include example inputs/outputs
   - Note any performance requirements

2. **Technical Requirements**
   - All tests pass
   - No linting errors
   - Project builds successfully
   - No breaking changes (unless intended)

## Agent Execution Notes

**Save as `[task-name]-plan.md` and ensure:**

- Every file change includes the complete file path
- All code snippets are complete and runnable
- All commands are exact and ready to execute
- Dependencies are specified with versions when critical
- The plan can be executed top-to-bottom without additional context

The goal is a plan so clear and complete that any build agent can execute it successfully without human intervention.
