# OpenCode Configuration

This directory contains the core configuration for OpenCode, a deeply integrated
AI development environment. It implements a three-layer architecture: OpenCode
core for execution, oh-my-opencode for agent orchestration, and superpowers for
workflow discipline.

## Table of Contents

- [Architecture](#architecture)
- [Directory Structure](#directory-structure)
- [Installation](#installation)
- [Workflow](#workflow)
- [Configuration Files](#configuration-files)
- [Plugins](#plugins)
- [MCP Servers](#mcp-servers)
- [Custom Agents](#custom-agents)
- [Custom Commands](#custom-commands)
- [Agent Model Assignments](#agent-model-assignments)
- [Category Model Assignments](#category-model-assignments)
- [Superpowers Integration](#superpowers-integration)
- [LSP and Formatters](#lsp-and-formatters)
- [Sandbox Compatibility](#sandbox-compatibility)
- [Troubleshooting](#troubleshooting)
- [See Also](#see-also)

## Architecture

The OpenCode environment is built on a modular, three-tier system:

| Layer | Component | Description |
| :--- | :--- | :--- |
| **Execution** | OpenCode Core | The primary engine providing tool access, file I/O, and LLM communication. |
| **Orchestration** | oh-my-opencode | Multi-agent framework that coordinates specialized agents like Sisyphus and Prometheus. |
| **Discipline** | superpowers | Engineering skills framework that enforces TDD, systematic debugging, and planning protocols. |

## Directory Structure

```text
opencode/.config/opencode/
├── agents/                             # Custom agent definitions
│   ├── commit.md                       # Conventional commit generation
│   ├── docs-writer.md                  # Documentation maintenance
│   └── review.md                       # Structured code review
├── command/                            # Custom slash commands
│   ├── analyze-project.md              # Deep project analysis (Serena fallback)
│   ├── commit.md                       # Commit workflow (delegates to @commit)
│   ├── do.md                           # Task execution
│   ├── plan.md                         # Planning workflow
│   ├── review.md                       # Review workflow
│   └── serena.md                       # Serena MCP activation
├── themes/                             # Custom TUI themes
│   └── tymon-kanagawa.json             # Kanagawa color scheme
├── AGENTS.md                           # Agent behavior guidelines
├── analyze-codebase-command-guide.md   # Detailed /analyze-project docs
├── oh-my-opencode.jsonc                # Agent orchestration settings
├── opencode.jsonc                      # Core configuration
├── plan-command-usage-guide.md         # Detailed /plan command docs
├── tui.jsonc                           # TUI appearance settings
└── README.md                           # This file
```

## Installation

### Deploy Configuration

Use GNU Stow to link the configuration files to your home directory:

```bash
cd ~/dotfiles
stow opencode
```

### Install Superpowers

Run the bootstrap script to install the superpowers plugin and skills:

```bash
~/dotfiles/bin/install-superpowers.sh
```

## Workflow

This setup supports two primary high-precision workflows for technical tasks.

### 1. Ultrawork Mode (Direct Execution)

Use `ulw` followed by a task for fast, autonomous execution. This activates
ultrawork mode, which enforces precision by exploring the codebase, creating a
plan, delegating to sub-agents, and verifying results.

```text
ulw implement JWT authentication for the REST API
```

### 2. Prometheus + /start-work (Strategic Planning)

For complex or ambiguous tasks, use the interview-driven planning workflow.

1. **Strategic Planning**: Type `@prometheus <task>` to start a requirement
   gathering interview.
2. **Review Plan**: Prometheus produces a detailed implementation plan in
   `.sisyphus/plans/`.
3. **Execution**: Run `/start-work` to begin the orchestration phase with
   Sisyphus.

For detailed decision guidance, refer to the
[oh-my-opencode orchestration guide](https://github.com/code-yeongyu/oh-my-opencode/blob/dev/docs/guide/orchestration.md#tldr---when-to-use-what).

## Configuration Files

| File | Purpose |
| :--- | :--- |
| `opencode.jsonc` | Core settings: models, providers, tool permissions, LSP, and MCP servers. |
| `oh-my-opencode.jsonc` | Orchestration settings: agent model assignments and background task limits. |
| `tui.jsonc` | Interface settings: appearance, themes, and keybindings. |
| `AGENTS.md` | System-level instructions defining agent behavior and engineering principles. |

## Plugins

- **oh-my-opencode**: Multi-agent orchestration providing specialized personas.
- **opencode-notify**: System-level notifications for long-running AI tasks.
- **opencode-agent-memory**: Persistent memory blocks that survive context
  compaction and sessions.

## MCP Servers

| Server | Purpose | Sandbox Status | Notes |
| :--- | :--- | :--- | :--- |
| git | Repository analysis | Disabled | Local-only, no network. |
| context7 | Documentation search | Disabled | Remote API, blocked by oh-my-opencode. |
| sequential-thinking | Complex reasoning | Disabled | Local-only, no network. |
| atlassian | JIRA and Confluence | Disabled | Internal network only. |

## Custom Agents

| Agent | Model | Purpose | Invocation |
| :--- | :--- | :--- | :--- |
| @commit | claude-haiku-4-5 | Conventional commit generation from diffs. | `@commit` |
| @docs-writer | (default) | Automated documentation generation and maintenance. | `@docs-writer` |
| @review | claude-opus-4-6 | Structured code review combining correctness and quality in a single pass. | `@review` |

## Custom Commands

| Command | Purpose |
| :--- | :--- |
| `/analyze-project` | Deep semantic project analysis. See [analyze-codebase-command-guide.md](./analyze-codebase-command-guide.md). |
| `/plan` | Technical planning with superpower integration. See [plan-command-usage-guide.md](./plan-command-usage-guide.md). |
| `/do` | Executes an implementation plan using the `executing-plans` skill. |
| `/review` | Triggers a structured review (supports both plan and code modes). |
| `/commit` | Triggers the `@commit` agent for message generation. |
| `/serena` | Manually activates the Serena MCP server for symbol-level analysis. |

## Agent Model Assignments

Model assignments are optimized based on specific agent roles.

| Agent | Model | Role |
| :--- | :--- | :--- |
| sisyphus | claude-opus-4-6 | Main orchestrator |
| prometheus | claude-opus-4-6 | Strategic planner |
| metis | claude-opus-4-6 | Plan gap analyzer |
| oracle | gpt-5.4 | Architecture consultant |
| momus | gpt-5.4 | Ruthless reviewer |
| hephaestus | gpt-5.3-codex | Autonomous deep worker |
| sisyphus-junior | claude-sonnet-4-6 | Focused task executor |
| librarian | gemini-3-flash-preview | Lightweight doc search |
| explore | grok-code-fast-1 | Fast codebase grep |
| multimodal-looker | gpt-5.4 | Image/document analysis |
| atlas | claude-sonnet-4-6 | Todo orchestration |

## Category Model Assignments

| Category | Model | Purpose |
| :--- | :--- | :--- |
| visual-engineering | gemini-3-pro-preview | Frontend and UI/UX tasks |
| artistry | gemini-3-pro-preview | Creative and novel approaches |
| ultrabrain | gpt-5.4 | Maximum reasoning capability |
| deep | gpt-5.3-codex | Complex problem-solving |
| quick | claude-haiku-4-5 | Trivial or repetitive tasks |
| writing | gemini-3-flash-preview | Documentation and prose |
| unspecified-high | claude-opus-4-6 | General complex work |
| unspecified-low | claude-sonnet-4-6 | General standard work |

## Superpowers Integration

The superpowers framework enforces engineering discipline through specialized
skills. Use the `skill` tool to invoke them.

### Core Skills

`using-superpowers`, `verification-before-completion`

### Development Skills

`test-driven-development`, `systematic-debugging`, `brainstorming`

### Planning Skills

`writing-plans`, `executing-plans`, `subagent-driven-development`,
`dispatching-parallel-agents`

### Review and Git Skills

`requesting-code-review`, `receiving-code-review`, `writing-skills`,
`using-git-worktrees`, `finishing-a-development-branch`

## LSP and Formatters

OpenCode uses the following tools for code intelligence and formatting:

| Language | LSP Server | Formatter |
| :--- | :--- | :--- |
| Markdown | rumdl | rumdl |
| Python | basedpyright | ruff |
| Lua | stylua | stylua |
| Shell | fish-lsp | shfmt |
| TOML | taplo | taplo |
| Go | golangci-lint-langserver | goimports |
| YAML | yaml-language-server | - |
| Docker | docker-langserver | - |

## Troubleshooting

- **Command Not Found**: Ensure you have run `stow opencode` and restarted the
  OpenCode session.
- **MCP Server Errors**: Check your environment variables, especially for
  Atlassian and Serena integrations.
- **Context Compaction**: If the agent loses context, check the
  `opencode-agent-memory` plugin to see if key information was preserved.
- **Skill Failures**: Ensure the superpowers repository is up to date with
  `cd ~/.config/opencode/superpowers && git pull`.

## Sandbox Compatibility

The OpenCode configuration is hardened for use within the official OpenCode
Sandbox. The environment enforces security by restricting network access and
specific providers.

### Configuration Hardening

Specific features are disabled in `oh-my-opencode.jsonc` to maintain sandbox
integrity:

```jsonc
{
  "disabled_hooks": ["agent-usage-reminder", "auto-update-checker"],
  "disabled_mcps": ["websearch", "context7", "grep_app", "git", "sequential-thinking", "atlassian"]
}
```

### Provider Restrictions

While the sandbox requires `enabled_providers: ["f5ai"]`, this is **NOT**
included in the shared `opencode.jsonc`. Adding it locally would break 16
`github-copilot/` model references for standard use. The sandbox enforces this
restriction at runtime via environment variables.

### Symlink Requirement

The sandbox expects configuration at `~/.local/opencode`. If you use the
standard `~/.config/opencode` location, create a symlink:

```bash
ln -s ~/.config/opencode ~/.local/opencode
```

## See Also

- [OpenCode Documentation](https://opencode.ai/docs)
- [oh-my-opencode Repository](https://github.com/code-yeongyu/oh-my-opencode)
- [Superpowers Repository](https://github.com/obra/superpowers)
- [Dotfiles AGENTS.md](../../../AGENTS.md)
