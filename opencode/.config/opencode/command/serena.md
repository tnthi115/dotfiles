---
description: Activate Serena MCP server and project in optimal configuration
agent: general
model: github-copilot/gpt-4.1
subtask: true
---

# Serena MCP Activation Command

Activates the Serena MCP server and project in the current directory with optimal configuration for development work.

## Activation Sequence

Execute the following Serena tools in order:

1. **Activate Project**: `activate_project "."` - Initialize Serena for current directory
2. **Check Onboarding**: `check_onboarding_performed` - Verify project setup status
3. **Run Onboarding** (if needed): `onboarding` - Complete project onboarding if not done
4. **Set Development Mode**: `switch_modes ["editing", "interactive"]` - Configure for active development
5. **Verify Configuration**: `get_current_config` - Confirm Serena is properly activated

## Expected Result

After successful activation:

- Serena MCP server is active and responsive
- Project is indexed and ready for development tasks
- Development modes are configured for editing and interactive work
- All Serena tools are available and functional

## Usage

Run this command at the start of any development session to ensure Serena is properly activated and configured for the current project.
