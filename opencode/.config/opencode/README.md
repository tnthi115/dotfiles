# OpenCode Configuration

This directory contains the core configuration for OpenCode, a deeply integrated
AI development environment. It implements a three-layer architecture: OpenCode
core for execution, oh-my-openagent for agent orchestration, and superpowers
for workflow discipline.

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

The OpenCode environment is built on a modular system:

| Layer | Component | Description |
| :--- | :--- | :--- |
| **Execution** | OpenCode Core | The primary engine providing tool access, file I/O, and LLM communication. |
| **Native Agents** | Custom Markdown Agents | Native OpenCode agents derived from oh-my-openagent prompts (planner, plan-reviewer, executor, code-reviewer). |
| **Discipline** | superpowers | Engineering skills framework that enforces TDD, systematic debugging, and planning protocols. |
| **Human Review** | Plannotator | Visual plan and code review UI for human approval gates. |

**Note**: The oh-my-openagent plugin is intentionally disabled to reduce runtime
overhead. The `oh-my-openagent.jsonc` file is kept as a dormant reference for
prompt extraction and model mappings. Native agents preserve the exact
high-value prompt text where behavior quality depends on it.

## Directory Structure

```text
opencode/.config/opencode/
├── agents/                             # Custom agent definitions
│   ├── commit.md                       # Conventional commit generation
│   ├── code-reviewer.md                # Native code review agent (Momus + Oracle)
│   ├── docs-writer.md                  # Documentation maintenance
│   ├── executor.md                     # Native execution agent (Sisyphus + Atlas + Hephaestus)
│   ├── git-master.md                   # Git operations specialist
│   ├── planner.md                      # Native planning agent (Prometheus + Oracle)
│   └── plan-reviewer.md                # Native plan review agent (Metis + Momus + Oracle)
├── command/                            # Custom slash commands
│   ├── init-deep.md                    # Deep project initialization
│   ├── commit.md                       # Commit workflow (delegates to @commit)
│   ├── do.md                           # Task execution (native executor agent)
│   ├── plan.md                         # Planning workflow (native planner agent)
│   ├── review-code.md                  # Code change review (native code-reviewer agent)
│   ├── review-plan.md                  # Plan review reference
│   └── serena.md                       # Serena MCP activation
├── themes/                             # Custom TUI themes
│   └── tymon-kanagawa.json             # Kanagawa color scheme
├── AGENTS.md                           # Agent behavior guidelines
│                                       # (removed - integrated into init-deep)
├── oh-my-openagent.jsonc               # Dormant reference (plugin disabled)
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

This setup uses a native agent workflow for complex tasks:

```text
/plan -> plan-reviewer -> Plannotator -> /do -> /review-code
```

### Complex Task Workflow

For complex or multi-step tasks, use the native agent workflow:

1. **Planning**: Type `/plan <task>` to create an implementation plan.
   - The native `planner` agent writes the plan
   - The native `plan-reviewer` agent critiques it
2. **Human Review**: The plan is prepared for Plannotator approval
3. **Execution**: Run `/do` to execute the approved plan
   - The native `executor` agent implements in order
   - Work is tracked with todos and verified incrementally
4. **Code Review**: Run `/review-code` for final review
   - The native `code-reviewer` agent provides structured findings

### Simple Task Workflow

For simple, well-defined tasks:

- Use direct tool execution with native OpenCode tools
- Use skills like `executing-plans` for single-file changes
- The `code-reviewer` agent can review small changes directly

### Plan Location

Plans are saved to: `.opencode/plans/[task-name]-plan.md`

This directory is git-ignored. Plans are ephemeral working documents for agent
execution, not version-controlled artifacts.

## Configuration Files

| File | Purpose |
| :--- | :--- |
| `opencode.jsonc` | Core settings: models, providers, tool permissions, LSP, and MCP servers. |
| `oh-my-openagent.jsonc` | Orchestration settings: agent model assignments and background task limits. |
| `tui.jsonc` | Interface settings: appearance, themes, and keybindings. |
| `AGENTS.md` | System-level instructions defining agent behavior and engineering principles. |

## Plugins

**Active:**

- **opencode-notify**: System-level notifications for long-running AI tasks.
- **opencode-agent-memory**: Persistent memory blocks that survive context
  compaction and sessions.
- **opencode-dcp**: Strips failed tool calls from context for cleaner reasoning.
- **opencode-vibeguard**: Tracks code quality drift and enforces engineering
  standards.
- **@plannotator/opencode**: Visual plan and code review UI for human approval.

**Disabled:**

- **oh-my-openagent**: Intentionally disabled to reduce overhead. The
  `oh-my-openagent.jsonc` file is kept as a dormant reference only.
- **opencode-smart-title**: Removed (cosmetic overhead, low value).

The native agent system replaces oh-my-openagent functionality with focused,
markdown-based agents that preserve the exact high-value prompt text.

## MCP Servers

| Server | Purpose | Sandbox Status | Notes |
| :--- | :--- | :--- | :--- |
| git | Repository analysis | Disabled | Local-only, no network. |
| context7 | Documentation search | Disabled | Remote API, blocked by oh-my-openagent. |
| sequential-thinking | Complex reasoning | Disabled | Local-only, no network. |
| atlassian | JIRA and Confluence | Disabled | Internal network only. |

## Native Custom Agents

| Agent | Model | Purpose | Invocation |
| :--- | :--- | :--- | :--- |
| `@planner` | claude-opus-4.6 | Write implementation plans with problem framing and architecture judgment. | `/plan` or `@planner` |
| `@plan-reviewer` | gpt-5.4 | Critique plans for executability, gaps, and blockers. | Built into `/plan` flow |
| `@executor` | gpt-5.4 | Execute approved plans with checkpoints, batching, and verification. | `/do` or `@executor` |
| `@code-reviewer` | claude-opus-4.6 | Structured code review with findings-first output and merge readiness. | `/review-code` or `@code-reviewer` |
| `@commit` | claude-haiku-4-5 | Conventional commit generation from diffs. | `@commit` |
| `@git-master` | claude-haiku-4-5 | Git operations, atomic commits, rebasing, branch management. | `@git-master` |
| `@docs-writer` | (default) | Automated documentation generation and maintenance. | `@docs-writer` |

### Agent Prompt Preservation

The native agents intentionally preserve exact high-value prompt text from
oh-my-openagent where behavior quality depends on it. Only infrastructure-
dependent sections (oh-my-openagent-specific routing, runtime hooks) are removed
or adapted.

### Legacy Reference

The `oh-my-openagent.jsonc` file contains historical agent configurations
(Prometheus, Sisyphus, Atlas, Hephaestus, Metis, Momus, Oracle) for reference
and possible future reuse. The plugin itself is disabled.

## Custom Commands

| Command | Purpose |
| :--- | :--- |
| `/init-deep` | Generate hierarchical AGENTS.md files throughout the project for directory-scoped AI context. |
| `/plan` | Technical planning with superpower integration. See [plan-command-usage-guide.md](./plan-command-usage-guide.md). |
| `/do` | Executes an implementation plan using the `executing-plans` skill. |
| `/review-code` | Review code changes on the current branch. |
| `/review-plan` | Review an implementation plan via Momus. |
| `/commit` | Triggers the `@commit` agent for message generation. |
| `/serena` | Manually activates the Serena MCP server for symbol-level analysis. |

## Native Agent Model Assignments

| Agent | Model | Role |
| :--- | :--- | :--- |
| planner | claude-opus-4.6 | Strategic planning with problem framing |
| plan-reviewer | gpt-5.4 | Plan critique and gap analysis |
| executor | gpt-5.4 | Execution with batching and verification |
| code-reviewer | claude-opus-4.6 | Findings-first code review |
| commit | claude-haiku-4-5 | Conventional commit generation |

### Legacy Reference Models (Dormant)

The `oh-my-openagent.jsonc` file contains these historical assignments:

| Agent | Model | Role |
| :--- | :--- | :--- |
| sisyphus | claude-opus-4.6 | Main orchestrator |
| prometheus | claude-opus-4.6 | Strategic planner |
| metis | claude-opus-4.6 | Plan gap analyzer |
| oracle | gpt-5.4 | Architecture consultant |
| momus | gpt-5.4 | Ruthless reviewer |
| hephaestus | gpt-5.4 | Autonomous deep worker |
| atlas | claude-sonnet-4.6 | Todo orchestration |

## Category Model Assignments

| Category | Model | Purpose |
| :--- | :--- | :--- |
| visual-engineering | gemini-3-pro-preview | Frontend and UI/UX tasks |
| artistry | gemini-3-pro-preview | Creative and novel approaches |
| ultrabrain | gpt-5.4 | Maximum reasoning capability |
| deep | gpt-5.3-codex | Complex problem-solving |
| quick | claude-haiku-4-5 | Trivial or repetitive tasks |
| writing | gemini-3-flash-preview | Documentation and prose |
| unspecified-high | claude-opus-4.6 | General complex work |
| unspecified-low | claude-sonnet-4.6 | General standard work |

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
- **Native agent not found**: Verify agent files exist in
  `~/.config/opencode/agents/` (planner.md, plan-reviewer.md, executor.md,
  code-reviewer.md).
- **Kimi Azure content filter errors**: Azure may flag prompts as "jailbreak"
  attempts and return a 400 error. This happens when the prompt contains
  instructions that trigger Microsoft's content filter. Workarounds:

  1. Switch to a different model temporarily: `@agent model=claude-opus-4.6`
  2. If using a LiteLLM router, configure `content_policy_fallbacks` in the

  router (not in opencode.jsonc): `[{"Kimi-K2.5": ["claude-opus-4.6"]}]`

  1. Retry with a shorter or rephrased prompt

## Sandbox Compatibility

The OpenCode configuration is hardened for use within the official OpenCode
Sandbox. The environment enforces security by restricting network access and
specific providers.

### Native Agent Compatibility

The native markdown-based agents are fully compatible with the OpenCode Sandbox
since they require no external plugins or network access beyond what OpenCode
core provides.

### Provider Restrictions

The OpenCode configuration uses three native F5 providers: `f5ai-anthropic`
(native Anthropic SDK), `f5ai-openai` (OpenAI SDK), and `f5ai-grok` (Grok via
OpenAI-compatible layer). Additionally, GitHub Copilot models are available via
the `github-copilot` provider.

For sandbox environments, see your sandbox documentation for provider
restrictions.

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
