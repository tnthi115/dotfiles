# OpenCode Configuration

This directory contains custom OpenCode configuration for enhanced AI-assisted
development workflows.

## Overview

This configuration extends OpenCode's built-in capabilities with custom
commands, agents, and workflows optimized for comprehensive project analysis and
AI collaboration.

### Key Features

- **AI-Optimized `/deep-init` Command**: Deep project analysis with code pattern
  extraction and actionable examples
- **Custom Commands**: Specialized workflows for common development tasks
- **Custom Agents**: Purpose-built AI agents for commit messages, documentation,
  and code review
- **Theme Integration**: Custom OpenCode themes

## `/deep-init` Command

The `/deep-init` command is a comprehensive project analysis tool optimized for
AI coding agents. Unlike the built-in `/init` command which creates basic
documentation, `/deep-init` performs deep architectural analysis, extracts
actual code patterns, parses tool configurations, and generates a detailed
`AGENTS.md` file with concrete examples that AI agents can immediately use.

### Hybrid Analysis Strategy

`/deep-init` uses a **two-tier approach** for maximum accuracy and reliability:

**1. Serena MCP (Preferred)** - Symbol-level semantic analysis when available:

- `serena_get_symbols_overview` - Maps all classes, functions, types
- `serena_find_symbol` - Finds pattern families (*Service, *Error, *Test, etc.)
- `serena_find_referencing_symbols` - Traces actual usage patterns
- `serena_search_for_pattern` - Semantic code pattern search
- `serena_read_file` - Language-aware file reading

**2. Fallback Tools** - Robust text-based analysis if Serena fails or is
unavailable:

- Read tool for file contents
- Grep tool for pattern searching
- Glob tool for file discovery
- Shell commands for text extraction

**Graceful Degradation**: If Serena MCP is not configured or any Serena
operation fails, the command automatically falls back to basic tools without
interrupting analysis. You always get comprehensive documentation regardless of
MCP availability.

## What It Does

The `/deep-init` command analyzes:

1. **Project Purpose & Domain** - What the project does and who uses it
2. **Technology Stack** - Languages, frameworks, dependencies, build tools with
   actual version detection
3. **Architecture & Design Patterns** - How the code is organized with real
   examples from the codebase
4. **Code Style & Conventions** - Actual naming patterns, import styles, error
   handling extracted from source
5. **Development Workflow** - Build, test, lint commands discovered from
   package.json/Makefile/scripts
6. **Tool Configurations** - Parse ESLint, Prettier, Ruff, mypy configs for
   validation rules
7. **Code Pattern Examples** - Real DO/DON'T examples extracted from the
   codebase
8. **File Placement Rules** - Where different file types belong based on
   observed structure
9. **Testing Patterns** - Actual test structure and conventions from existing
   tests
10. **Git Workflow** - Commit patterns and branching strategies from git history

### Key Differences from Built-in `/init`

**Built-in `/init`**:

- Creates basic AGENTS.md with general project info
- Provides descriptive documentation
- Good starting point for human-readable docs

**Custom `/deep-init`**:

- **Semantic code analysis** via Serena MCP (with automatic fallback)
- **Symbol-level pattern extraction** (classes, functions, types, references)
- **Extracts actual code examples** from your source files
- **Parses tool configurations** (ESLint, Prettier, Ruff, mypy, etc.)
- **Shows real patterns** with DO/DON'T examples from your codebase
- **Creates structured tables** for file placement and naming rules
- **Analyzes git history** to understand change patterns
- **Provides copy-paste commands** that work with your specific setup
- **References specific files** as pattern examples
- **Optimized for AI agents** to understand and follow your conventions
- **Graceful degradation** - works even without Serena MCP configured

## How to Use

### Basic Usage

Navigate to any project directory and run:

```bash
cd /path/to/your/project
opencode
```

Then in the OpenCode TUI, run:

```text
/deep-init
```

### What Happens

1. **Analysis Phase**: The command spawns a subagent that:
   - Scans your project structure
   - Reads configuration files (package.json, pyproject.toml, go.mod, etc.)
   - **Extracts actual code samples** from source files
   - **Parses linting/formatting configs** (ESLint, Prettier, Ruff, mypy)
   - **Analyzes import patterns** from real source code
   - **Examines test files** to understand testing conventions
   - Studies git history for commit patterns
   - Investigates build/test/lint scripts

2. **Pattern Extraction**: The agent identifies:
   - Architectural patterns with code examples (MVC, microservices, monolith,
     etc.)
   - Design patterns with actual usage (Repository, Factory, Singleton, etc.)
   - **Real naming conventions** from function/class/variable names in source
   - **Actual error handling patterns** (try-catch, custom errors, etc.)
   - **Testing strategies** with example test structure
   - **Tool validation rules** extracted from config files
   - **Import/module organization** patterns from source code

3. **Documentation Generation**: Creates a comprehensive `AGENTS.md` with:
   - Repository purpose and overview
   - Technology stack with detected versions
   - Architecture with code examples
   - **DO/DON'T code examples** from actual codebase
   - Development workflow commands (actual scripts from package.json/Makefile)
   - **File placement rules** in structured tables
   - **Validation rules** from linting/formatting configs
   - **Concrete code patterns** with file references
   - Quality standards with tool configurations
   - Git workflow with commit message patterns
   - AI agent-specific instructions with actionable examples

### Expected Output

After running `/deep-init`, you'll have:

- **AGENTS.md** in your project root with comprehensive AI-optimized
  documentation
- A summary showing:
  - Project type identified
  - Primary language/framework with versions
  - Key architectural patterns with code examples
  - Notable conventions extracted from source
  - Tool configurations (linters, formatters, type checkers)
  - Example commands that work with your project
  - Any unclear areas needing clarification

## Benefits

### For AI Agents

- **Better Context**: AI agents understand your project's architecture and
  conventions
- **Consistent Code**: Agents follow your established patterns
- **Proper Testing**: Agents know your testing strategy and frameworks
- **Quality Adherence**: Agents respect your linting, formatting, and security
  practices

### For Developers

- **Onboarding**: New team members quickly understand the project
- **Documentation**: Single source of truth for project knowledge
- **Standards**: Codifies conventions and best practices
- **Reference**: Quick lookup for commands, patterns, and workflows

## Comparison with Built-in `/init`

| Feature | Built-in `/init` | Enhanced `/init` |
|---------|------------------|------------------|
| Creates AGENTS.md | ✅ | ✅ |
| Analyzes project structure | Basic | Deep analysis |
| Identifies tech stack | ✅ | Detailed with versions |
| Extracts architecture patterns | ❌ | ✅ |
| Documents code conventions | ❌ | ✅ |
| Analyzes build/test workflow | ❌ | ✅ |
| Identifies design patterns | ❌ | ✅ |
| Documents quality standards | ❌ | ✅ |
| Includes AI agent guidelines | ❌ | ✅ |
| Shows example commands | ❌ | ✅ |

## Example AGENTS.md Structure

```markdown
# AGENTS.md

## Repository Purpose
[2-3 paragraphs describing the project]

## Technology Stack
### Core Technologies
- Language(s): TypeScript 5.0+
- Framework(s): Next.js 14, React 18
- Runtime: Node.js 20.x
- Package Manager: pnpm

### Key Dependencies
- next: Web framework
- react: UI library
- prisma: ORM
- zod: Schema validation

## Architecture & Design
### Project Structure
- /app - Next.js app router
- /components - Reusable UI components
- /lib - Shared utilities and logic
- /prisma - Database schema and migrations

### Design Patterns
- Repository pattern for data access
- React hooks for state management
- Server actions for mutations

## Development Workflow
### Build Commands
`pnpm build`
### Test Commands
`pnpm test`

## Code Style & Best Practices
[... and much more]
```

## Tips

1. **Run Early**: Execute `/init` when starting work on a new project
2. **Re-run After Changes**: If your project architecture changes significantly,
   run `/init` again to update AGENTS.md
3. **Commit AGENTS.md**: Add it to version control so all developers and AI
   agents benefit
4. **Review and Edit**: The AI does its best, but you can manually edit
   AGENTS.md to add project-specific context
5. **Use with Planning**: Run `/init` first, then use the plan agent to
   understand the codebase before making changes

## Customization

The command is located at:

```text
~/dotfiles/opencode/.config/opencode/command/init.md
```

You can customize:

- The analysis depth (modify shell commands in the template)
- The AGENTS.md structure (edit the markdown template)
- The agent/model used (change frontmatter configuration)
- Additional analysis steps (add new sections)

## Troubleshooting

**Issue**: Command not found

- **Solution**: Ensure you've symlinked dotfiles with `stow opencode` or restart
  OpenCode

**Issue**: Analysis takes too long

- **Solution**: This is normal for large projects. The subagent is doing
  comprehensive analysis.

**Issue**: AGENTS.md is incomplete

- **Solution**: The AI might need more context. You can manually edit AGENTS.md
  or provide additional guidance by running the command with follow-up
  instructions.

**Issue**: Want different model/agent

- **Solution**: Edit `~/dotfiles/opencode/.config/opencode/command/init.md`
  frontmatter to change `agent` or `model`

## Advanced Usage

### Custom Analysis for Specific Project Types

You can create specialized init commands for different project types:

```bash
# Python projects
/init-python

# Node.js/TypeScript projects
/init-node

# Monorepo projects
/init-monorepo
```

Just copy `init.md` and customize the analysis sections for each type.

## Directory Structure

```text
opencode/.config/opencode/
├── agent/                      # Custom AI agents
│   ├── commit.md              # Conventional commit message generation
│   ├── docs-writer.md         # Documentation generation and maintenance
│   └── review.md              # Code review assistance
├── command/                    # Custom slash commands
│   ├── commit.md              # Commit workflow command
│   ├── do.md                  # Task execution command
│   ├── init.md                # Enhanced project initialization
│   ├── plan.md                # Planning and analysis command
│   └── serena.md              # Serena MCP integration command
├── themes/                     # Custom OpenCode themes
│   └── tymon-kanagawa.json    # Kanagawa color scheme
├── AGENTS.md                   # Agent behavior guidelines
├── opencode.jsonc             # Main OpenCode configuration
└── README.md                  # This file
```

## Configuration Files

### opencode.jsonc

Main configuration file containing:

- Model configurations
- Provider settings
- Tool permissions
- LSP server configurations
- Formatter settings
- MCP server integrations

### AGENTS.md

Guidelines for AI agent behavior and interaction patterns specific to this
dotfiles repository.

## Custom Commands

### `/init` - Enhanced Project Initialization

Deep project analysis that creates comprehensive AGENTS.md documentation.

**Usage**: `/init` in any project directory

**Features**:

- Analyzes architecture patterns (MVC, microservices, monolith, etc.)
- Identifies tech stack with versions
- Extracts code conventions and patterns
- Documents build/test workflows
- Captures quality standards
- Provides AI agent guidelines

### `/plan` - Planning and Analysis

Creates detailed implementation plans without making code changes.

### `/commit` - Conventional Commit Generation

Generates properly formatted conventional commit messages.

### `/serena` - Serena MCP Integration

Advanced code intelligence using Serena Model Context Protocol.

## Custom Agents

### commit

Generates conventional commit messages following project standards.

**Mode**: Subagent
**Usage**: `@commit` or via `/commit` command

### docs-writer

Creates and maintains project documentation.

**Mode**: Subagent
**Usage**: `@docs-writer`

### review

Performs code review for quality and best practices.

**Mode**: Subagent
**Usage**: `@review`

## Installation

These configurations are automatically symlinked when you stow the opencode
directory:

```bash
cd ~/dotfiles
stow opencode
```

This creates symlinks from `~/.config/opencode/` to this directory.

## Usage Tips

1. **Start with `/init`**: Run `/init` in any project to create comprehensive
   AGENTS.md documentation
2. **Use Plan Mode**: Switch to plan agent (Tab key) before making significant
   changes
3. **Leverage Subagents**: Use `@commit`, `@docs-writer`, `@review` for
   specialized tasks
4. **Customize Commands**: Edit command files in `command/` directory to fit
   your workflow

## Superpowers Integration

This configuration integrates with [superpowers](https://github.com/obra/superpowers),
a skills framework that enforces workflow discipline (TDD, systematic debugging,
planning) complementing oh-my-opencode's agent orchestration.

### How They Work Together

| Layer | Tool | Purpose |
|-------|------|---------|
| **Agent Infrastructure** | oh-my-opencode | Multi-agent orchestration (Sisyphus, Oracle, Prometheus) |
| **Workflow Discipline** | superpowers | Mandatory processes (TDD, systematic debugging, planning) |

### Available Superpowers Skills

- `superpowers/test-driven-development` - Strict RED-GREEN-REFACTOR enforcement
- `superpowers/systematic-debugging` - 4-phase root cause analysis
- `superpowers/brainstorming` - Socratic design refinement
- `superpowers/writing-plans` - Detailed task breakdown (2-5 min granularity)
- `superpowers/executing-plans` - Batch execution with checkpoints
- `superpowers/subagent-driven-development` - Two-stage review gates
- `superpowers/requesting-code-review` - Pre-review checklist
- `superpowers/receiving-code-review` - Feedback workflow
- `superpowers/using-git-worktrees` - Isolated development branches
- `superpowers/finishing-a-development-branch` - Branch completion workflow

### Installation

Run the bootstrap script:

```bash
~/dotfiles/bin/install-superpowers.sh
```

Or manually:

```bash
git clone https://github.com/obra/superpowers.git ~/.config/opencode/superpowers
mkdir -p ~/.config/opencode/plugins ~/.config/opencode/skills
ln -s ~/.config/opencode/superpowers/.opencode/plugins/superpowers.js ~/.config/opencode/plugins/superpowers.js
ln -s ~/.config/opencode/superpowers/skills ~/.config/opencode/skills/superpowers
```

Restart OpenCode after installation.

### Updating Superpowers

```bash
cd ~/.config/opencode/superpowers && git pull
```

### Verification

Ask OpenCode: "do you have superpowers?"

## See Also

- [OpenCode Commands Documentation](https://opencode.ai/docs/commands)
- [OpenCode Agents Documentation](https://opencode.ai/docs/agents)
- [Superpowers Repository](https://github.com/obra/superpowers)
- [Dotfiles AGENTS.md](../../../AGENTS.md) for overall project context
