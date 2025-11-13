# OpenCode /plan Command Usage Guide

## Overview

The `/plan` command creates comprehensive implementation plans for development tasks using the specialized planning agent.

## Usage

### Basic Syntax

```
/plan [task description]
```

### Examples

```
/plan adding dark mode support to the application
/plan implementing user authentication system
/plan refactoring the database layer
/plan adding CI/CD pipeline
/plan migrating to TypeScript
```

## Command Configuration

The `/plan` command is configured in two ways:

### 1. Markdown File (Primary)

**Location**: `~/.config/opencode/command/plan.md`

- Uses frontmatter for configuration
- Cleaner and more maintainable
- Easy to edit and version control

### 2. JSON Configuration (Backup)

**Location**: `opencode.jsonc` under `"command"` section

- Inline JSON configuration
- Useful for programmatic generation

## Features

### Automatic Context Analysis

The command automatically gathers project context:

- **File Structure**: Discovers relevant project files (_.md, _.json, _.js, _.ts, _.py, _.go)
- **Git Status**: Shows current working tree status
- **Recent History**: Displays last 5 commit messages for context

### Comprehensive Planning Framework

Generated plans include:

1. **Objective & Scope**
   - Clear problem statement
   - Success criteria
   - Scope boundaries

2. **Technical Analysis**
   - Current state assessment
   - Dependencies and constraints
   - Technology stack considerations

3. **Implementation Strategy**
   - Step-by-step breakdown
   - Timeline estimates
   - Risk assessment

4. **Validation Plan**
   - Testing approach
   - Quality gates
   - Rollback strategy

### Agent Integration

- **Agent**: Uses the specialized `plan` mode
- **Model**: Configured for `github-copilot/claude-sonnet-4.5`
- **Permissions**: Read-only analysis with markdown-only editing
- **Output**: Automatically saves as markdown document

## Agent Behavior

The planning agent operates with these restrictions:

- **File Editing**: Only markdown files (.md, .markdown)
- **Commands**: Read-only bash commands for analysis
- **Focus**: Analysis and planning, not implementation
- **Documentation**: Always creates structured markdown plans

## Output Format

Plans are saved as markdown documents with descriptive filenames like:

- `plan.md` (generic)
- `dark-mode-implementation-plan.md`
- `authentication-system-plan.md`
- `database-refactoring-plan.md`

## Best Practices

### Effective Command Usage

```bash
# Be specific about the task
/plan implementing OAuth2 authentication with Google and GitHub providers

# Include constraints or requirements
/plan migrating from MySQL to PostgreSQL while maintaining zero downtime

# Specify scope when dealing with large systems
/plan refactoring the user management module in the admin dashboard
```

### Command Integration in Workflow

1. **Planning Phase**: Use `/plan` to create detailed implementation strategy
2. **Review Phase**: Examine generated plan before implementation
3. **Implementation**: Follow plan step-by-step
4. **Validation**: Execute testing and quality gates from plan

## Technical Details

### Shell Command Integration

The command uses shell command injection with `!` syntax:

- `!`find . -type f -name "\*.md"`` - Discovers markdown files
- `!`git status --porcelain`` - Shows git working tree status
- `!`git log --oneline -5`` - Recent commit history

### Argument Substitution

- `$ARGUMENTS` placeholder gets replaced with the command arguments
- Full argument string is passed as-is to the planning prompt

## Troubleshooting

### Command Not Found

- Ensure markdown file exists at `~/.config/opencode/command/plan.md`
- Check JSON configuration in `opencode.jsonc`
- Verify OpenCode configuration syntax is valid

### Permission Issues

- Confirm planning agent has proper read-only bash permissions
- Verify edit permissions allow markdown files only
- Check write permissions are disabled for security

### Agent Not Working

- Validate plan mode configuration in `opencode.jsonc`
- Ensure GitHub Copilot model is accessible
- Check agent prompt merge was successful

## Configuration Files Modified

- `~/.config/opencode/command/plan.md` - Command definition
- `opencode/.config/opencode/opencode.jsonc` - JSON configuration backup
- Plan mode configuration with merged system prompt

## Security Notes

- Uses read-only commands for analysis
- Cannot modify source code or configuration files
- Restricted to markdown document creation only
- Safe for use in production environments
