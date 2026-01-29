---
description: Activate Serena MCP server and project for manual context optimization
agent: general
model: f5/gpt-5-mini
subtask: true
---

# Serena MCP Activation Command

Activates the Serena MCP server and project in the current directory for
development work. Serena provides manual tools for context optimization, memory
management, and session continuity in OpenCode workflows.

## Activation Sequence

1. **Activate Project**: `activate_project "."` — Initialize Serena for the
   current directory
2. **Check Onboarding**: `check_onboarding_performed` — Verify project setup
   status
3. **Run Onboarding** (if needed): `onboarding` — Complete project onboarding if
   not done
4. **Set Development Mode**: `switch_modes ["editing", "interactive"]` —
   Configure for active development
5. **Verify Configuration**: `get_current_config` — Confirm Serena is properly
   activated

## Manual Context & Memory Management

Use Serena's memory tools to:

- Save important discoveries, architectural decisions, or next steps (
  `write_memory`)
- Retrieve previous context or notes (`list_memories`, `read_memory`)
- Prepare for session handoff or context resets (`prepare_for_new_conversation`)

## When to Use

- At the start of a development session (activate Serena)
- Before context loss or long interruptions (save key information)
- When resuming work (retrieve relevant memories)
- To document important findings or decisions

## Expected Result

- Serena MCP server is active and responsive
- Project is indexed and ready for development tasks
- Development modes are set for editing and interactive work
- Serena memory tools are available for manual context management

## Usage

Run this command at the start of any development session, or whenever you need
to optimize context or save/retrieve important information with Serena.
