# OpenCode Configuration

This directory contains the core configuration for OpenCode, a cost-optimized AI
development environment. It implements a three-tier model architecture:
**Kimi K2.6** ($0.60/$3) for primary orchestration, **GitHub Copilot** (free)
for subagent heavy lifting (planning, execution, review), and **superpowers**
for workflow discipline. The oh-my-openagent plugin is intentionally disabled to
eliminate per-request token injection overhead.

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

The OpenCode environment is built on a modular, cost-optimized system:

| Layer | Component | Model | Cost | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Orchestration** | OpenCode Core | `f5ai-moonshot/Kimi-K2.6` | $0.60/$3 | Primary agent — chat, tool routing, task classification |
| **Native Agents** | Custom Markdown Agents | `github-copilot/*` | **Free** | Planning, execution, review, commits (heavy lifting) |
| **Discipline** | superpowers | — | — | Skills framework enforcing TDD, debugging, planning |
| **Human Review** | Plannotator | — | — | Visual plan and code review UI for approval gates |
| **Fallback** | Emergency models | `f5ai-openai/gpt-5` | $1.25/$10 | Only if Kimi + Copilot both fail |

**Design rationale**: Primary agents delegate expensive work to Copilot
subagents while staying cheap for conversational turns. This eliminates
per-request token injection overhead from oh-my-openagent and minimizes F5AI
spending.

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

This setup uses a native agent workflow for complex tasks with
**auto-delegation**:

```text
/plan -> plan-reviewer -> Plannotator -> /do -> /review-code
```

You do **not** need to manually invoke `/plan`, `/do`, or `/review-code`. The
primary `build`/`plan` agent (Kimi) recognizes your intent and delegates to the
appropriate Copilot subagent automatically. Only invoke subagents directly if
you want to override the default routing.

### Complex Task Workflow

For complex or multi-step tasks, the workflow is:

1. **Planning**: Say "Plan user authentication" or `/plan <task>`
   - Primary agent auto-routes to `@planner` (Copilot claude-opus-4.6)
   - The planner interviews you first to clarify requirements
   - Auto-transitions to plan generation when requirements are clear
   - Saves plan to `.opencode/plans/[task-name]-plan.md`
   - Auto-dispatches `plan-reviewer` agent for critique
2. **Human Review**: The plan is prepared for Plannotator approval
3. **Execution**: Say "Implement it" or run `/do`
   - Primary agent auto-routes to `@executor` (Copilot gpt-5.4)
   - Implements in order, tracks with todos, verifies incrementally
4. **Code Review**: Say "Review my changes" or run `/review-code`
   - Primary agent auto-routes to `@code-reviewer` (Copilot claude-opus-4.6)
   - Provides structured findings with severity

### Simple Task Workflow

For simple, well-defined tasks:

- The primary agent may handle directly (for trivial edits, formatting)
- Or auto-delegate to the cheapest appropriate subagent
- `@commit` handles commit message generation
- `@git-master` handles complex git operations

### Cost Per Workflow Turn

| Step | Model | Approx Cost |
|------|-------|-------------|
| User asks for plan | Kimi (orchestration) | ~$0.002 |
| Planner writes plan | Copilot claude-opus-4.6 | **Free** |
| Plan-reviewer critiques | Copilot gpt-5.4 | **Free** |
| Executor implements | Copilot gpt-5.4 | **Free** |
| Code-reviewer reviews | Copilot claude-opus-4.6 | **Free** |

**Result**: An entire complex task costs ~$0.02 in F5AI tokens (the
orchestration overhead), with all heavy lifting done by Copilot at zero marginal
cost.

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
| context7 | Documentation search | Disabled | Remote API. Not configured by default (commented out in MCP config). |
| sequential-thinking | Complex reasoning | Disabled | Local-only, no network. |
| atlassian | JIRA and Confluence | Disabled | Internal network only. |

## Native Custom Agents

All heavy-lifting agents run on **GitHub Copilot** (zero marginal cost). The
primary orchestrator (`build`/`plan`) runs on cheap **Kimi K2.6** ($0.60/$3).

| Agent | Model | Provider | Purpose | Invocation |
| :--- | :--- | :--- | :--- | :--- |
| `@planner` | `claude-opus-4.6` | `github-copilot` | Strategic planning consultant — interviews first, creates plans, dispatches plan-reviewer. | `/plan` or `@planner` |
| `@plan-reviewer` | `gpt-5.4` | `github-copilot` | Critique plans for executability, gaps, and blockers. | Built into `/plan` flow |
| `@executor` | `gpt-5.4` | `github-copilot` | Execute approved plans with checkpoints, batching, and verification. | `/do` or `@executor` |
| `@code-reviewer` | `claude-opus-4.6` | `github-copilot` | Structured code review with findings-first output and merge readiness. | `/review-code` or `@code-reviewer` |
| `@commit` | `claude-haiku-4.5` | `github-copilot` | Conventional commit generation from diffs. | `@commit` |
| `@git-master` | `claude-haiku-4.5` | `github-copilot` | Git operations, atomic commits, rebasing, branch management. | `@git-master` |
| `@docs-writer` | (default) | — | Automated documentation generation and maintenance. | `@docs-writer` |

### Auto-Delegation

The primary `build`/`plan` agents are configured to **auto-delegate** to the
appropriate subagent based on user intent. You do not need to manually invoke
`/plan`, `/do`, or `/review-code` — the primary agent recognizes the task and
routes it automatically:

```text
User: "Implement user authentication"
→ Kimi (orchestrator, $0.002) → /do → Copilot executor (free)
```

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
| `/plan` | Interview-driven planning with Prometheus behavior. Auto-saves to `.opencode/plans/`, dispatches plan-reviewer. See [plan-command-usage-guide.md](./plan-command-usage-guide.md). |
| `/do` | Executes an implementation plan using the `executing-plans` skill. |
| `/review-code` | Review code changes on the current branch. |
| `/review-plan` | Review an implementation plan via Momus. |
| `/commit` | Triggers the `@commit` agent for message generation. |
| `/serena` | Manually activates the Serena MCP server for symbol-level analysis. |

## Native Agent Model Assignments

| Agent | Model | Provider | Role |
| :--- | :--- | :--- | :--- |
| `planner` | `claude-opus-4.6` | `github-copilot` | Strategic planning with problem framing |
| `plan-reviewer` | `gpt-5.4` | `github-copilot` | Plan critique and gap analysis |
| `executor` | `gpt-5.4` | `github-copilot` | Execution with batching and verification |
| `code-reviewer` | `claude-opus-4.6` | `github-copilot` | Findings-first code review |
| `commit` | `claude-haiku-4.5` | `github-copilot` | Conventional commit generation |
| `git-master` | `claude-haiku-4.5` | `github-copilot` | Git operations specialist |

### Primary Agent Configuration

| Agent | Model | Fallback Chain |
| :--- | :--- | :--- |
| `build` | `f5ai-moonshot/Kimi-K2.6` | `github-copilot/gpt-5.4` → `f5ai-openai/gpt-5` → `github-copilot/claude-sonnet-4.6` |
| `plan` | `f5ai-moonshot/Kimi-K2.6` | `github-copilot/gpt-5.4` → `f5ai-openai/gpt-5` → `github-copilot/claude-sonnet-4.6` |

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

## Model Tier Strategy

Since the oh-my-openagent plugin is disabled, category-based model assignments
no longer apply. Instead, models are assigned by **tier** based on cost and
responsibility:

### Tier 1 — Primary Orchestrator ($)

| Model | Cost | Context | Role |
| :--- | :--- | :--- | :--- |
| `Kimi-K2.6` | $0.60/$3 | 262K | Chat, orchestration, tool routing. Delegates to subagents. |

### Tier 2 — Copilot Subagents (Free)

| Model | Provider | Role |
| :--- | :--- | :--- |
| `claude-opus-4.6` | `github-copilot` | Planning, deep reasoning, code review |
| `gpt-5.4` | `github-copilot` | Plan critique, execution |
| `claude-haiku-4.5` | `github-copilot` | Commits, git operations |

### Tier 3 — Emergency Fallbacks ($$)

| Model | Cost | Context | When |
| :--- | :--- | :--- | :--- |
| `gpt-5` | $1.25/$10 | 272K | If both Kimi and Copilot fail |

### Usage Rule

> **90% of tokens should be on Kimi (Tier 1). Subagents handle all heavy lifting
> via Copilot (Tier 2). F5AI fallbacks (Tier 3) are for emergencies only.**

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
- **Agent instructions not taking effect**: The `instructions` array in
  `opencode.jsonc` is **additive** — it appends to the agent's built-in prompt,
  it does not replace it. Use `prompt` (not `instructions`) if you need to
  override the entire system prompt.
- **Config validation**: OpenCode validates JSONC at startup. If you see parse
  errors, check for trailing commas (invalid in JSON but accepted in JSONC) or
  unclosed quotes/brackets.
- **F5AI quota burned too fast**: Verify that primary agents (`build`/ `plan`)
  delegate to Copilot subagents. If the primary agent attempts complex work
  itself instead of routing to subagents, check the `instructions` field in
  `opencode.jsonc` includes the auto-delegate rules.
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
