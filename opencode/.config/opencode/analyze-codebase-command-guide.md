# OpenCode /analyze-codebase Command

## Overview

The `/analyze-codebase` command performs comprehensive codebase analysis and automatically generates optimized AGENTS.md files using the specialized codebase-analyzer agent.

## Usage

### Basic Syntax

```
/analyze-codebase
```

**Note**: This command works without arguments and automatically analyzes the current working directory.

### Examples

```
# Analyze current project automatically
/analyze-codebase

# The command will:
# - Detect project type (React, Node.js, Go, Python ML, etc.)
# - Extract real commands from configuration files
# - Generate comprehensive AGENTS.md file
# - Use appropriate template based on detected project type
```

## What It Does

### Automatic Project Detection

The command automatically detects:

- **Project Type**: React SPA, Node.js API, Go microservice, Python ML, Static site, or Generic
- **Technology Stack**: Languages, frameworks, dependencies with versions
- **Build Tools**: Package managers, bundlers, task runners
- **Configuration Files**: package.json, go.mod, pyproject.toml, Makefiles, Dockerfiles

### Comprehensive Analysis

Performs deep analysis of:

1. **Repository Structure**
   - Directory organization and patterns
   - File type distribution and naming conventions
   - Configuration file discovery

2. **Technology Stack**
   - Dependencies from lockfiles (package-lock.json, go.sum, etc.)
   - Development tools and build systems
   - Testing frameworks and CI/CD configurations

3. **Code Patterns**
   - Architecture patterns (Clean Architecture, MVC, microservices)
   - Import/export styles and module organization
   - Error handling and logging patterns

4. **Real Command Extraction**
   - Build commands from package.json scripts
   - Test execution with coverage options
   - Linting, formatting, and type checking commands
   - **Only extracts existing commands - never generates fake ones**

## Agent Configuration

- **Agent**: `codebase-analyzer` (specialized subagent)
- **Model**: `github-copilot/claude-sonnet-4.5`
- **Execution**: Runs as subtask to avoid polluting main context
- **Tools**: task, write, read, glob, grep, list

## Template-Driven Analysis

The command uses specialized templates based on detected project type:

- **React SPA** (`react-spa-template.md`): Component patterns, state management, routing
- **Node.js API** (`nodejs-api-template.md`): Authentication, database patterns, middleware
- **Go Microservice** (`golang-microservice-analyzer.md`): Clean Architecture, gRPC patterns
- **Python ML** (`python-ml-template.md`): ML pipelines, experiment tracking, data validation
- **Static Site** (`static-site-template.md`): Content management, build optimization, SEO
- **Generic**: Comprehensive analysis for unrecognized project types

## Generated AGENTS.md Structure

The command generates a complete AGENTS.md file with:

### Repository Overview

- Clear project purpose and architecture description
- Complete technology stack with exact versions
- Project type classification

### Development Environment Setup

- Exact prerequisite installation instructions
- Real setup commands extracted from project files
- Local development workflow

### Build, Test & Quality Commands

```bash
# Real commands extracted from package.json, Makefile, etc.
npm run build          # Production build
npm test              # Run tests
npm run lint          # Code linting
```

### Code Style & Architecture Guidelines

- File organization patterns (based on actual structure)
- Naming conventions (extracted from real code)
- Architecture patterns (detected, not assumed)
- Import/export styles and best practices

### Agent Optimization Guidelines

- Quality gates for automated execution
- Project-specific AI agent instructions
- Common patterns and troubleshooting
- Security and performance considerations

## Command Features

### Context Analysis Commands

The command automatically runs these analysis commands:

```bash
# Directory structure overview
find . -maxdepth 3 -type f -name "*.json" -o -name "*.toml" -o -name "*.yml"

# Project type detection
ls -la | grep -E "(package\.json|go\.mod|pyproject\.toml|requirements\.txt)"

# Repository status
git status --porcelain | head -10
```

### Quality Standards

- **100% Real Commands**: Only extracts existing commands from project files
- **Verified Paths**: All referenced files and directories must exist
- **Project-Specific**: Content based on actual analysis, not generic templates
- **Actionable**: Any AI agent can follow the instructions successfully
- **Validated**: All commands tested before inclusion in AGENTS.md

### Performance Optimizations

- **Smart Sampling**: Analyzes representative files from each directory
- **Template Selection**: Uses appropriate specialized template for faster analysis
- **Caching**: Caches analysis results for unchanged git commits
- **Parallel Analysis**: Runs multiple analysis phases concurrently

## Output

### AGENTS.md File Location

- Generated in project root as `AGENTS.md`
- Overwrites existing AGENTS.md files
- Follows standard AGENTS.md format for AI agent compatibility

### Success Metrics

A successful analysis should:

- Complete in <5 minutes for typical projects
- Generate commands that work 95%+ of the time
- Reference only files/paths that actually exist
- Provide specific, actionable guidance for AI agents
- Enable immediate effective AI agent operation

## Integration with Other Commands

### Workflow Integration

```bash
# 1. Analyze codebase and generate AGENTS.md
/analyze-codebase

# 2. Create implementation plan using generated insights
/plan implementing new authentication system

# 3. Use generated quality commands in development
npm run lint && npm test  # Commands from generated AGENTS.md
```

### Agent Template System

The command integrates with OpenCode's agent template system:

- Automatically selects appropriate template based on project detection
- Uses specialized agents for deep analysis (golang-microservice-analyzer, etc.)
- Falls back to generic analysis for unrecognized project types

## Configuration Files

### Command Definition Files

- **Markdown**: `~/.config/opencode/command/analyze-codebase.md`
- **JSON**: `opencode.jsonc` under `"command"` section
- **Agent**: `~/.config/opencode/agent/codebase-analyzer.md`

### Related Agent Templates

- `~/.config/opencode/agent/golang-microservice-analyzer.md`
- `~/.config/opencode/agent/nodejs-api-template.md`
- `~/.config/opencode/agent/python-ml-template.md`
- `~/.config/opencode/agent/react-spa-template.md`
- `~/.config/opencode/agent/static-site-template.md`

## Troubleshooting

### Command Not Working

- Verify codebase-analyzer agent exists at `~/.config/opencode/agent/codebase-analyzer.md`
- Check that GitHub Copilot model is accessible
- Ensure command definition files exist in both markdown and JSON formats

### Analysis Issues

- Verify project has git repository (git status required)
- Check that relevant project files exist (package.json, go.mod, etc.)
- Ensure sufficient permissions for file system analysis

### Generated AGENTS.md Issues

- Validate that all referenced commands actually work in your environment
- Check that file paths in AGENTS.md point to existing files
- Verify technology stack versions match your actual dependencies

## Security Notes

- Analyzes only project files, respects .gitignore patterns
- Does not modify existing source code
- Read-only analysis of configuration files
- Generates documentation only, no code changes
