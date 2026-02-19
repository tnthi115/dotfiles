# OpenCode Configuration

This directory contains custom OpenCode configuration for enhanced AI-assisted
development workflows.

## Overview

This configuration extends OpenCode's built-in capabilities with custom
commands, agents, and workflows optimized for comprehensive project analysis and
AI collaboration. It integrates with
[oh-my-opencode](https://github.com/code-yeongyu/oh-my-opencode) for multi-agent
orchestration and [superpowers](https://github.com/obra/superpowers) for
workflow discipline.

### Key Features

- **oh-my-opencode Integration**: Multi-agent orchestration with Sisyphus,
  Oracle, Prometheus, and specialized agents
- **superpowers Skills**: Workflow discipline through TDD, debugging, and
  planning skills
- **Custom `/analyze-project` Command**: Deep project analysis with code pattern
  extraction and actionable examples
- **Custom Commands**: Specialized workflows for common development tasks
- **Custom Agents**: Purpose-built AI agents for commit messages, documentation,
  and code review
- **Theme Integration**: Custom OpenCode themes

## `/analyze-project` Command

> **Note:** This is a custom command distinct from oh-my-opencode's built-in
> `/init-deep`. Use `/init-deep` for oh-my-opencode's standard initialization,
> or `/analyze-project` for this custom Serena-first analysis workflow.

The `/analyze-project` command is a comprehensive project analysis tool
optimized for AI coding agents. It performs deep architectural analysis,
extracts actual code patterns, parses tool configurations, and generates a
detailed `AGENTS.md` file with concrete examples that AI agents can immediately
use.

### Hybrid Analysis Strategy

`/analyze-project` uses a **two-tier approach** for maximum accuracy and
reliability:

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

The `/analyze-project` command analyzes:

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

### Key Differences from Built-in Commands

**Built-in `/init`**:

- Creates basic AGENTS.md with general project info
- Provides descriptive documentation
- Good starting point for human-readable docs

**oh-my-opencode `/init-deep`**:

- Multi-agent deep analysis via oh-my-opencode
- Uses oh-my-opencode's agent orchestration
- Recommended for most use cases

**Custom `/analyze-project`**:

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
/analyze-project
```

Or use oh-my-opencode's built-in command:

```text
/init-deep
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

After running `/analyze-project`, you'll have:

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

## Comparison of Init Commands

| Feature | `/init` | `/init-deep` (omo) | `/analyze-project` |
|---------|---------|--------------------|--------------------|
| Creates AGENTS.md | ✅ | ✅ | ✅ |
| Analyzes project structure | Basic | Deep | Deep |
| Identifies tech stack | ✅ | Detailed | Detailed with versions |
| Extracts architecture patterns | ❌ | ✅ | ✅ |
| Documents code conventions | ❌ | ✅ | ✅ |
| Analyzes build/test workflow | ❌ | ✅ | ✅ |
| Identifies design patterns | ❌ | ✅ | ✅ |
| Documents quality standards | ❌ | ✅ | ✅ |
| Includes AI agent guidelines | ❌ | ✅ | ✅ |
| Shows example commands | ❌ | ✅ | ✅ |
| Serena MCP (preferred) | ❌ | ❌ | ✅ |
| Graceful fallback | N/A | N/A | ✅ |

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

1. **Run Early**: Execute `/init-deep` or `/analyze-project` when starting work
   on a new project
2. **Re-run After Changes**: If your project architecture changes significantly,
   run the init command again to update AGENTS.md
3. **Commit AGENTS.md**: Add it to version control so all developers and AI
   agents benefit
4. **Review and Edit**: The AI does its best, but you can manually edit
   AGENTS.md to add project-specific context
5. **Use with Planning**: Run `/init-deep` first, then use the plan agent to
   understand the codebase before making changes

## Customization

The `/analyze-project` command is located at:

```text
~/dotfiles/opencode/.config/opencode/command/analyze-project.md
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

- **Solution**: Edit
  `~/dotfiles/opencode/.config/opencode/command/analyze-project.md` frontmatter
  to change `agent` or `model`

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

Just copy `analyze-project.md` and customize the analysis sections for each
type.

## Directory Structure

```text
opencode/.config/opencode/
├── agent/                              # Custom AI agents
│   ├── commit.md                       # Conventional commit message generation
│   ├── docs-writer.md                  # Documentation generation and maintenance
│   └── review.md                       # Code review assistance
├── command/                            # Custom slash commands
│   ├── analyze-project.md              # Custom project analysis (Serena-first)
│   ├── commit.md                       # Commit workflow command (delegates to @commit)
│   ├── do.md                           # Task execution command
│   ├── plan.md                         # Planning and analysis command
│   └── serena.md                       # Serena MCP integration command
├── themes/                             # Custom OpenCode themes
│   └── tymon-kanagawa.json             # Kanagawa color scheme
├── AGENTS.md                           # Agent behavior guidelines
├── analyze-codebase-command-guide.md   # /analyze-codebase documentation
├── oh-my-opencode.jsonc                # oh-my-opencode plugin configuration
├── opencode.jsonc                      # Main OpenCode configuration
├── plan-command-usage-guide.md         # /plan command documentation
└── README.md                           # This file
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

### oh-my-opencode.jsonc

[oh-my-opencode](https://github.com/code-yeongyu/oh-my-opencode) plugin
configuration containing:

- **Agent configurations**: Model assignments for Sisyphus, Oracle, Prometheus,
  etc.
- **Category configurations**: Model assignments for task categories
  (visual-engineering, ultrabrain, quick, etc.)
- **Background task settings**: Concurrency limits for parallel agent execution
- **Experimental features**: Context pruning and auto-resume settings

#### Agent Model Assignments

| Agent | Model | Purpose |
|-------|-------|---------|
| `sisyphus` | claude-opus-4-5 | Main orchestration agent |
| `sisyphus-junior` | claude-sonnet-4-5 | Focused task executor |
| `prometheus` | claude-opus-4-5 | Strategic planning |
| `metis` | claude-opus-4-5 | Pre-planning analysis |
| `momus` | gpt-5.2 | Plan review |
| `oracle` | gpt-5.2 | Architecture consultation |
| `librarian` | claude-sonnet-4-5 | Documentation lookup |
| `explore` | claude-haiku-4-5 | Codebase investigation |

#### Category Model Assignments

| Category | Model | Purpose |
|----------|-------|---------|
| `visual-engineering` | claude-sonnet-4-5 | Frontend, UI/UX work |
| `ultrabrain` | gpt-5.2-codex | Complex logic tasks |
| `artistry` | claude-sonnet-4-5 | Creative problem-solving |
| `quick` | claude-haiku-4-5 | Trivial tasks |
| `writing` | claude-sonnet-4-5 | Documentation |

### AGENTS.md

Guidelines for AI agent behavior and interaction patterns specific to this
dotfiles repository, including:

- Core engineering principles
- Tool selection (native vs Serena)
- Superpowers skill integration
- Context preservation with Serena memory

## Custom Commands

### `/analyze-project` - Custom Project Analysis

Deep project analysis with Serena MCP preference and graceful fallback.

**Usage**: `/analyze-project` in any project directory

**Features**:

- Serena MCP tools preferred for semantic analysis
- Automatic fallback to Read/Grep/Glob if Serena unavailable
- Analyzes architecture patterns (MVC, microservices, monolith, etc.)
- Identifies tech stack with versions
- Extracts code conventions and patterns
- Documents build/test workflows
- Captures quality standards
- Provides AI agent guidelines

> **Note:** For most cases, use oh-my-opencode's built-in `/init-deep` instead.

### `/plan` - Planning and Analysis

Creates detailed implementation plans without making code changes.

**Usage**: `/plan [task description]`

**Features**:

- Phase 0 current state analysis
- Issue identification (performance, correctness, security)
- Structured task breakdown optimized for agent execution
- Saves to `.sisyphus/plans/` directory

### `/do` - Task Execution

Executes an implementation plan with the build agent.

**Usage**: `/do` or `/do @plan-file.md`

**Features**:

- Preflight dependency checking
- Incremental validation after each change
- Full quality gates at completion
- Error handling with rollback suggestions

### `/commit` - Conventional Commit Generation

Generates properly formatted conventional commit messages.

**Usage**: `/commit`

**Note**: This command delegates to the `@commit` agent.

### `/review` - Structured Two-Pass Review

Reviews plans or code changes with structured two-pass feedback.

**Usage:**

```bash
# Plan Review (before execution)
/review @.sisyphus/plans/feature.md

# Code Review (after execution)
/review                              # Changes since origin/main
/review HEAD~5                       # Last 5 commits
/review @.sisyphus/plans/feature.md HEAD~3  # With plan context
```

**Features:**

- **Auto mode detection**: Plan file → plan review, git range → code review
- **Two-pass structure**:
  - Pass 1: Correctness & Completeness (requirements, scope, edge cases)
  - Pass 2: Quality (patterns, best practices, linting)
- **Best-effort plan context**: Finds plan in `.sisyphus/plans/` if not
  specified
- **Runs actual linters**: Executes configured linters, includes output in
  review
- **Unified report**: Combined findings with severity summary and
  recommendations

### `/serena` - Serena MCP Integration

Activates Serena MCP server for manual context optimization.

**Usage**: `/serena`

**Features**:

- Project activation and onboarding
- Development mode configuration
- Memory management for session continuity

## Custom Agents

### @commit

Generates conventional commit messages following project standards.

**Mode**: Subagent
**Model**: gpt-5-mini
**Usage**: `@commit` (agent, not a slash command)

**Features**:

- Analyzes staged changes via MCP git tools
- Detects and preserves GitLab/Jira reference footers from branch history
- Follows Conventional Commits format (type(scope?): subject)
- Requires verification before claiming success
- Uses `superpowers:verification-before-completion` skill

### @docs-writer

Creates and maintains project documentation.

**Mode**: Subagent
**Usage**: `@docs-writer`

**Features**:

- Token-efficient, scannable documentation
- Concrete code examples with syntax highlighting
- Proper markdown structure with tables and headers
- Uses `superpowers:writing-skills` skill

### @review

Performs code review for quality and best practices.

**Mode**: Subagent
**Model**: claude-opus-4-5
**Usage**: `@review`

**Features**:

- Categorized feedback (Critical, Important, Minor, Strengths)
- Specific file:line references for each issue
- Read-only mode (cannot modify code)
- Uses `superpowers:requesting-code-review` skill

## Superpowers Integration

This configuration integrates with
[superpowers](https://github.com/obra/superpowers), a skills framework that
enforces workflow discipline (TDD, systematic debugging, planning) complementing
oh-my-opencode's agent orchestration.

### How They Work Together

| Layer | Tool | Purpose |
|-------|------|---------|
| **Agent Orchestration** | oh-my-opencode | Multi-agent system (Sisyphus, Oracle, Prometheus, etc.) |
| **Workflow Discipline** | superpowers | Mandatory processes (TDD, systematic debugging, planning) |
| **Custom Commands** | /plan, /do, /analyze-project | Project-specific workflows with skill integration |
| **Custom Agents** | @commit, @review, @docs-writer | Specialized tasks with skill references |

### Integrated Workflow Examples

**Planning a Feature:**

```bash
# Option 1: Quick technical plan (clear requirements)
/plan "Add user authentication"
# Uses superpowers:writing-plans for bite-sized tasks

# Option 2: Consultative planning (unclear requirements)
# Invoke Prometheus agent for interview-driven design
# Uses Metis for gap analysis, optionally Momus for review
```

**Executing a Plan:**

```bash
# Execute with discipline
/do @.sisyphus/plans/auth-plan.md
# Uses superpowers:executing-plans for batch execution with checkpoints
```

**Making a Commit:**

```bash
# Stage changes, then use the @commit agent (not a /commit command):
@commit
# Uses superpowers:verification-before-completion for evidence-based success claims
```

> **Note:** `@commit` is an agent, not a command. Use it by typing `@commit` in the
> chat, not as a slash command.

### Command vs Skill Relationship

| Command/Agent | Integrates With | Provides |
|---------------|-----------------|----------|
| `/plan` | `writing-plans` skill | Quick technical planning |
| `/do` | `executing-plans` skill | Disciplined execution |
| `@commit` | `verification-before-completion` skill | Evidence-based commits |
| `@review` | `requesting-code-review` skill | Structured feedback |
| `@docs-writer` | `writing-skills` skill | Quality documentation |

### Available Superpowers Skills

**Core Skills:**

- `superpowers/using-superpowers` - Skill invocation protocol (check before ANY
  task)
- `superpowers/verification-before-completion` - Evidence before claims

**Development Skills:**

- `superpowers/test-driven-development` - Strict RED-GREEN-REFACTOR enforcement
- `superpowers/systematic-debugging` - 4-phase root cause analysis
- `superpowers/brainstorming` - Socratic design refinement

**Planning & Execution Skills:**

- `superpowers/writing-plans` - Detailed task breakdown (2-5 min granularity)
- `superpowers/executing-plans` - Batch execution with checkpoints
- `superpowers/subagent-driven-development` - Two-stage review gates
- `superpowers/dispatching-parallel-agents` - Parallel task execution

**Review Skills:**

- `superpowers/requesting-code-review` - Pre-review checklist
- `superpowers/receiving-code-review` - Feedback workflow
- `superpowers/writing-skills` - Documentation quality standards

**Git Skills:**

- `superpowers/using-git-worktrees` - Isolated development branches
- `superpowers/finishing-a-development-branch` - Branch completion workflow

### Superpowers Installation

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

### Verifying Superpowers

Verify superpowers is installed correctly:

```bash
# Check skill files exist
ls ~/.config/opencode/skills/superpowers/

# Check plugin is linked
ls -la ~/.config/opencode/plugins/superpowers.js

# Or ask OpenCode directly
opencode  # Then ask: "do you have superpowers?"
```

## Installation

These configurations are automatically symlinked when you stow the opencode
directory:

```bash
cd ~/dotfiles
stow opencode
```

This creates symlinks from `~/.config/opencode/` to this directory.

## Usage Tips

1. **Start with `/init-deep`**: Run oh-my-opencode's `/init-deep` in any project
   to create comprehensive AGENTS.md documentation
2. **Use Plan Mode**: Switch to plan agent (Tab key) before making significant
   changes
3. **Leverage Subagents**: Use `@commit`, `@docs-writer`, `@review` for
   specialized tasks
4. **Customize Commands**: Edit command files in `command/` directory to fit
   your workflow
5. **Check Skills First**: Always check if a superpowers skill applies before
   starting any task

## See Also

- [OpenCode Documentation](https://opencode.ai/docs)
- [oh-my-opencode Repository](https://github.com/code-yeongyu/oh-my-opencode)
- [Superpowers Repository](https://github.com/obra/superpowers)
- [Dotfiles AGENTS.md](../../../AGENTS.md) for overall project context
