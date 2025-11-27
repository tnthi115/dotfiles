# Deprecated OpenCode Agents

This directory contains OpenCode agent templates that have been deprecated in favor of the **Serena MCP server**.

## Deprecated Date

November 26, 2025

## Reason for Deprecation

These codebase analysis agents have been replaced by the Serena MCP server, which provides:

- More comprehensive code analysis capabilities
- Better symbol-level understanding and manipulation
- Native LSP integration for code intelligence
- More efficient and accurate codebase navigation
- Memory management for complex tasks

## Deprecated Agents

The following agents are no longer actively used:

### Codebase Analysis System

- `codebase-analyzer.md` - Main comprehensive analyzer
- `codebase-analyzer-test-suite.md` - Testing suite for analyzer
- `agents-md-generator.md` - AGENTS.md file generator
- `agents-md-validator.md` - AGENTS.md validation

### Project Discovery & Analysis

- `project-discovery.md` - Project type detection
- `technology-stack-analyzer.md` - Tech stack analysis
- `pattern-recognition.md` - Code pattern identification
- `security-auditor.md` - Security analysis

### Project-Specific Templates

- `golang-microservice-analyzer.md` - Go microservice analysis
- `nodejs-api-template.md` - Node.js API template
- `python-ml-template.md` - Python ML template
- `react-spa-template.md` - React SPA template
- `static-site-template.md` - Static site template

## Replacement

Use the **Serena MCP server** instead for all codebase analysis needs. Serena provides superior code understanding through:

- `serena_find_symbol` - Find code symbols by name
- `serena_find_referencing_symbols` - Find symbol references
- `serena_get_symbols_overview` - Get file structure overview
- `serena_search_for_pattern` - Pattern-based code search
- `serena_replace_symbol_body` - Intelligent symbol replacement
- `serena_read_file` - Read files with context
- And many more specialized tools

See the Serena configuration at `~/dotfiles/serena/.serena/serena_config.yml`

## Migration Notes

If you need to perform codebase analysis:

1. Use Serena tools directly for code-level operations
2. Use standard shell tools (`find`, `grep`, `rg`) for file-level operations
3. Refer to project-specific AGENTS.md files for architecture documentation

These files are kept for historical reference only and may be removed in future versions.
