# OpenCode Configuration

This directory contains a hybrid OpenCode setup combining
**native custom agents** with **OpenAgentsControl (OAC)**. The configuration
supports both workflows:

- **Native agents** for specific tasks (@planner, @executor, @code-reviewer,
  @commit)
- **OAC agents** for context-aware, approval-gated workflows (OpenAgent,
  OpenCoder)

## Quick Reference

| Use Case | Agent/Command | Notes |
|----------|---------------|-------|
| General questions | `opencode --agent OpenAgent` | OAC, approval gates, context discovery |
| Complex development | `opencode --agent OpenCoder` | OAC, plan→approve→execute workflow |
| Plan a feature | `@planner` or `/plan` | Native, creates `.opencode/plans/` |
| Execute approved plan | `@executor` or `/do` | Native, executes plan files |
| Code review | `@code-reviewer` or `/review-code` | Native, findings-first output |
| Conventional commit | `@commit` or `/commit` | Native (OAC skipped this command) |
| Add project patterns | `/add-context` | OAC command, teaches agents your style |

## Architecture

### Three-Tier Model (Native Agents)

| Layer | Component | Model | Cost | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Orchestration** | OpenCode Core | `f5ai-moonshot/Kimi-K2.6` | $0.60/$3 | Chat, tool routing, orchestration |
| **Native Agents** | Custom Markdown Agents | `github-copilot/*` | **Free** | @planner, @executor, @code-reviewer, @commit |
| **OAC Agents** | Context-Aware Agents | `github-copilot/*` | **Free** | OpenAgent, OpenCoder with automatic ContextScout |

### OAC Integration

OAC provides:

- **ContextScout** — Automatic discovery of project patterns before execution
- **ExternalScout** — Live documentation fetching for external libraries
- **Approval Gates** — Mandatory approval before any file write/command
  execution
- **Context System** — Structured pattern storage in `context/` directory

## Directory Structure

```text
opencode/.config/opencode/
├── agent/
│   ├── core/                    # OAC core agents
│   │   ├── openagent.md         # General tasks, questions
│   │   ├── opencoder.md         # Production development
│   │   └── system-builder.md    # Custom AI system generation
│   ├── subagents/               # OAC subagents
│   │   ├── code/                # Code-specific agents
│   │   ├── core/                # Core workflow agents
│   │   ├── development/         # Development specialists
│   │   └── system-builder/      # System builder
│   ├── commit.md                # Native: Conventional commit agent
│   ├── code-reviewer.md         # Native: Code review agent
│   ├── docs-writer.md           # Native: Documentation agent
│   ├── executor.md              # Native: Plan execution agent
│   ├── git-master.md            # Native: Git operations agent
│   ├── plan-reviewer.md         # Native: Plan critique agent
│   └── planner.md               # Native: Planning agent
├── agents/                      # Native agent storage (legacy format)
│   ├── commit.md
│   ├── code-reviewer.md
│   ├── docs-writer.md
│   ├── executor.md
│   ├── git-master.md
│   ├── plan-reviewer.md
│   └── planner.md
├── command/                     # Commands (native + OAC)
│   ├── add-context.md           # OAC: Interactive context wizard
│   ├── analyze-patterns.md      # OAC: Pattern analysis
│   ├── clean.md                 # OAC: Cleanup operations
│   ├── commit.md                # Native: Commit command
│   ├── context.md               # OAC: Context management
│   ├── do.md                    # Native: Execute plan
│   ├── init-deep.md             # Native: Initialize deep context
│   ├── openagents/              # OAC-specific commands
│   ├── optimize.md              # OAC: Code optimization
│   ├── plan.md                  # Native: Create plan
│   ├── plannotator-*.md         # Plannotator integration
│   ├── review-*.md              # Review commands
│   ├── serena.md                # Memory management
│   ├── test.md                  # OAC: Testing workflows
│   └── validate-repo.md         # OAC: Repository validation
├── context/                     # OAC context system
│   ├── core/                    # Universal standards
│   │   ├── standards/           # Code quality, security, docs, tests
│   │   ├── workflows/           # Design iteration, task delegation
│   │   └── task-management/     # Task schema
│   ├── ui/web/                  # Design patterns
│   ├── development/             # Language-specific
│   └── project-intelligence/    # YOUR custom patterns (empty initially)
├── skills/                      # OAC skills
│   ├── task-management/         # Task breakdown tools
│   └── context7/                # External doc fetching
└── [config files]
```

## When to Use What

### Use OAC (OpenAgent/OpenCoder) When

- You want automatic context discovery
- You need approval gates at every step
- Working with external libraries (ExternalScout fetches current docs)
- Teaching agents your project patterns via `/add-context`
- You prefer structured, approval-based workflows

### Use Native Agents When

- You want faster execution (no mandatory approval gates)
- Using existing workflows you're familiar with
- Need parallel execution (@executor can delegate to multiple agents)
- Specific agent expertise needed (@code-reviewer, @docs-writer)
- Creating conventional commits (@commit)

## Workflow Examples

### Example 1: Create a Feature (OAC Way)

```bash
# Start with context-aware agent
cd ~/your-project
opencode --agent OpenCoder

# OAC will:
# 1. ContextScout discovers your project patterns
# 2. Proposes a plan (you approve)
# 3. Executes step-by-step with validation
# 4. Asks for approval before each file write
```

### Example 2: Create a Feature (Native Way)

```bash
# Plan with native planner
opencode --agent @planner
# "Create a user authentication system"
# Creates: .opencode/plans/auth-feature.md

# Execute with native executor
opencode --agent @executor
# Or: /do @.opencode/plans/auth-feature.md
```

### Example 3: Add Project Patterns

```bash
cd ~/your-project
opencode --agent OpenAgent

# Type: /add-context
# Answer interactive questions about your:
# - Tech stack
# - API patterns
# - Component patterns
# - Naming conventions
# - Security requirements
```

## Configuration Updates Needed

### 1. Update opencode.jsonc

The `opencode.jsonc` currently references native agents. For OAC integration, no
changes are required — OAC agents are loaded via the `agent/` directory
structure.

However, you may want to:

- Add OAC-specific model assignments if desired
- Update disabled_hooks if OAC conflicts with existing setup

### 2. Context System Initialization

OAC context system is empty until you run `/add-context`. To initialize:

```bash
cd ~/your-project
opencode --agent OpenAgent
# /add-context
```

### 3. Deprecating Native Agents (Optional)

If you want to hide native agents to avoid confusion:

**Option A: Remove agent files**

```bash
cd ~/dotfiles
rm opencode/.config/opencode/agent/planner.md
rm opencode/.config/opencode/agent/executor.md
rm opencode/.config/opencode/agent/code-reviewer.md
rm opencode/.config/opencode/agent/plan-reviewer.md
# Keep: commit.md, docs-writer.md, git-master.md (OAC doesn't replace these)

stow --restow opencode
```

**Option B: Move to archive**

```bash
mkdir -p ~/dotfiles/opencode/.config/opencode/agent/.archive
mv opencode/.config/opencode/agent/planner.md agent/.archive/
# etc.

stow --restow opencode
```

**Recommended:** Keep native agents for now, use OAC alongside. Deprecate
gradually.

## Known Integration Points

### What OAC Skipped (Because You Had Them)

- `command/commit.md` — Your native commit command preserved
- Some context files that overlapped with your existing setup

### What Coexists Peacefully

- Your `@commit` agent with OAC's approval-gated workflow
- Your native `/plan` and `/do` with OAC's OpenCoder
- Plannotator integration with OAC context system

### Potential Conflicts

None identified. The architectures are complementary:

- Native agents: Fast, parallel, flexible
- OAC agents: Structured, context-aware, approval-gated

## Superpowers Integration

OAC respects superpowers skills:

- `superpowers:test-driven-development` — Enforced before implementation
- `superpowers:systematic-debugging` — Used for troubleshooting
- `superpowers:executing-plans` — Batch execution with checkpoints

## Rollback

If you need to remove OAC and restore native-only config:

```bash
cd ~/dotfiles

# Restore from backup
tar xzf opencode-backup-native-20260501.tar.gz

# Remove OAC files
rm -rf opencode/.config/opencode/agent/core/
rm -rf opencode/.config/opencode/agent/subagents/
rm -rf opencode/.config/opencode/command/add-context.md
rm -rf opencode/.config/opencode/command/analyze-patterns.md
rm -rf opencode/.config/opencode/command/clean.md
rm -rf opencode/.config/opencode/command/context.md
rm -rf opencode/.config/opencode/command/optimize.md
rm -rf opencode/.config/opencode/command/test.md
rm -rf opencode/.config/opencode/command/validate-repo.md
rm -rf opencode/.config/opencode/command/openagents/
rm -rf opencode/.config/opencode/context/
rm -rf opencode/.config/opencode/skills/
rm -rf opencode/.config/opencode/config/
rm -rf opencode/.config/opencode/tool/

# Restow
stow --restow opencode
```

## Migration Path

**Phase 1: Evaluation (Current)**

- OAC installed alongside native agents
- Try both, see what works for your workflow

**Phase 2: Gradual Adoption**

- Use OAC for new projects via `/add-context`
- Keep native agents for existing workflows

**Phase 3: Full Adoption (Optional)**

- Remove native agents you don't need
- Standardize on OAC for context-aware work

## See Also

- [OAC README](https://github.com/darrenhinde/OpenAgentsControl/blob/main/README.md)
- [OAC Context System Guide](https://github.com/darrenhinde/OpenAgentsControl/blob/main/CONTEXT_SYSTEM_GUIDE.md)
- [OAC Compatibility](https://github.com/darrenhinde/OpenAgentsControl/blob/main/COMPATIBILITY.md)
- Your backup: `opencode-backup-native-20260501.tar.gz`
