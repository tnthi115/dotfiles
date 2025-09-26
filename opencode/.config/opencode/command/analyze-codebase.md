---
description: Analyze codebase and generate comprehensive AGENTS.md file
agent: codebase-analyzer
model: github-copilot/claude-sonnet-4
subtask: true
---

Perform comprehensive codebase analysis and generate an optimized AGENTS.md file for the current project.

## Project Context Analysis

Current directory structure overview:
!`find . -maxdepth 3 -type f -name "*.json" -o -name "*.toml" -o -name "*.yml" -o -name "*.yaml" -o -name "Makefile" -o -name "Dockerfile" | head -20`

Project type detection:
!`ls -la | grep -E "(package\.json|go\.mod|pyproject\.toml|requirements\.txt|Cargo\.toml)"`

Repository status:
!`git status --porcelain | head -10`

File count analysis:
!`find . -type f -not -path "./.git/*" -not -path "./node_modules/*" -not -path "./dist/*" -not -path "./build/*" | wc -l`

## Analysis Objectives

Perform comprehensive analysis to generate an accurate AGENTS.md file that includes:

1. **Repository Purpose & Architecture**
   - Identify project type and core purpose from actual files and structure
   - Analyze complete technology stack and dependencies with exact versions
   - Extract real commands from configuration files (package.json, Makefile, scripts)

2. **Development Environment Setup**
   - Detect prerequisites and installation requirements from project files
   - Extract actual build, test, and development commands that exist in the project
   - Validate all commands work in the current environment

3. **Code Style & Architecture Guidelines**
   - Analyze actual code patterns and conventions from source files
   - Identify architecture patterns (Clean Architecture, MVC, microservices) used in the project
   - Extract naming conventions from real code samples and directory structure

4. **Agent Optimization Guidelines**
   - Create project-specific guidance for AI agents based on actual project patterns
   - Define quality gates and automated checks from existing configurations
   - Identify common patterns and troubleshooting approaches from the codebase

## Analysis Requirements

- **Template-Driven Analysis**: Use appropriate specialized template based on detected project type
- **Real Commands Only**: Extract actual commands from package.json, Makefile, scripts - never generate hypothetical commands
- **Verified Paths**: Reference only existing files and directories found in the project
- **Project-Specific Content**: Base all analysis on actual code patterns, not generic templates or assumptions
- **Quality Validation**: Test all commands and references before inclusion in AGENTS.md

## Output Requirements

Generate a complete, accurate AGENTS.md file that:
- Enables any AI agent to work effectively in this codebase immediately
- Contains only verified, working commands extracted from the project
- Provides specific, actionable guidance based on actual project structure and patterns
- Follows the comprehensive structure defined in the codebase-analyzer template
- Uses the detected project template (React SPA, Node.js API, Go microservice, Python ML, Static site) for targeted analysis

Focus on accuracy over comprehensiveness. Better to have fewer correct commands than many incorrect ones.

Analyze the current working directory as the target project and generate the AGENTS.md file in the project root.