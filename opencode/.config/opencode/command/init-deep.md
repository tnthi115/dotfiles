---
description: Generate hierarchical AGENTS.md files throughout the project (root + subdirectories)
agent: docs-writer
model: github-copilot/claude-sonnet-4.6
subtask: true
---

# Deep Project Initialization

Generate hierarchical AGENTS.md files throughout the project. Each file
provides directory-scoped context so AI agents automatically receive relevant
guidelines when working in that area of the codebase.

## Execution Instructions

**CRITICAL: Your ONLY task is to analyze this project and create hierarchical
AGENTS.md files, then STOP.**

**What you MUST do:**

- Analyze the project structure and codebase
- Create AGENTS.md in the project root (comprehensive)
- Create AGENTS.md in key subdirectories (scoped, concise)
- Provide a brief summary when complete

**What you MUST NOT do:**

- Do NOT implement features or refactor code
- Do NOT create files other than AGENTS.md
- Do NOT modify existing code or configurations
- Do NOT run builds, tests, or deployment commands

Your job is complete once all AGENTS.md files are written and summarized.

## Phase 1: Project Structure Discovery

Use tools to map the project layout:

### Preferred Approach

1. **Glob** to discover project files and directory structure
2. **Read** configuration files (package.json, pyproject.toml, go.mod, etc.)
3. **Grep** for code patterns, imports, and conventions
4. **Bash** for git history analysis and directory listing

### Directory Tree Discovery

```bash
timeout 10s find . -maxdepth 4 -type d \
  -not -path '*/node_modules/*' \
  -not -path '*/.git/*' \
  -not -path '*/dist/*' \
  -not -path '*/build/*' \
  -not -path '*/__pycache__/*' \
  -not -path '*/venv/*' \
  -not -path '*/.venv/*' \
  -not -path '*/.next/*' \
  -not -path '*/.turbo/*' \
  -not -path '*/vendor/*' \
  -not -path '*/target/*' 2>/dev/null | sort
```

### Identify Key Directories for AGENTS.md Files

Select directories that benefit from scoped context. Typical candidates:

- **Project root** (always)
- **`src/`** or **`pkg/`** or **`lib/`** (main source directory)
- **`src/components/`** or equivalent (UI components)
- **`src/api/`** or **`internal/`** (API/backend layer)
- **`tests/`** or **`test/`** (testing directory)
- **`scripts/`** or **`tools/`** (tooling)
- **`docs/`** (documentation, if substantial)

**Selection criteria:**

- Directory has 5+ files or 3+ subdirectories
- Directory represents a distinct architectural boundary
- Directory has conventions that differ from the project root
- Maximum depth: 3 levels from project root
- Maximum AGENTS.md files: 6 (1 root + up to 5 subdirectories)

## Phase 2: Root AGENTS.md Generation

Create a comprehensive `AGENTS.md` at the project root covering:

### Required Sections

1. **Repository Purpose** (2-3 sentences)
2. **Technology Stack** (table: language, framework, package manager, versions)
3. **Development Environment Setup** (prerequisites, install, run commands)
4. **Build, Test & Quality Commands** (exact copy-pasteable commands)
5. **Code Style & Architecture Guidelines** (naming, patterns, structure)
6. **Agent Optimization Guidelines** (quality gates, common patterns)

### Content Rules

- **Extract, don't infer**: Base all patterns on actual code, not assumptions
- **Real commands only**: Verify commands exist in package.json/Makefile/etc.
- **Concrete examples**: Use DO/DON'T format with real code from the codebase
- **No placeholders**: No `[TODO]`, `[INSERT_HERE]`, or `[Language + Version]`
- **Actual versions**: Read from package.json, pyproject.toml, go.mod, etc.
- **File references**: Point to specific files as pattern examples

### Optional Sections (include if applicable)

1. **Import Patterns** (10-15 actual import examples)
2. **Architecture & Constraints** (key decisions with rationale)
3. **Security Patterns** (auth, validation, CORS)
4. **API & Integration Patterns** (clients, database, data fetching)

## Phase 3: Subdirectory AGENTS.md Generation

For each selected subdirectory, create a **concise** AGENTS.md (50-150 lines)
covering ONLY what is specific to that directory.

### Subdirectory AGENTS.md Template

```markdown
# [Directory Name] — Agent Context

## Purpose

[1-2 sentences: what this directory contains and its role]

## Key Conventions

- [Convention 1: e.g., "All files use PascalCase naming"]
- [Convention 2: e.g., "Each component has a colocated test file"]
- [Convention 3: e.g., "Exports go through index.ts barrel files"]

## File Organization

| Pattern | Example | Purpose |
|---------|---------|---------|
| [pattern] | [real file] | [what it does] |

## Code Patterns

[1-2 DO/DON'T examples specific to this directory]

## Testing

[How tests work in this directory specifically]

## Common Pitfalls

- [Pitfall 1 specific to this directory]
- [Pitfall 2 specific to this directory]
```

### Subdirectory Content Rules

- **Inherit from root**: Do NOT repeat information already in root AGENTS.md
- **Directory-specific only**: Only include conventions unique to this directory
- **Concise**: 50-150 lines maximum per subdirectory AGENTS.md
- **Cross-reference root**: Add a note like "See project root AGENTS.md for
  general guidelines"

## Phase 4: Existing AGENTS.md Handling

- If `AGENTS.md` already exists at project root:
  - **Read it first** to understand current content
  - **Preserve** any manually curated sections
  - **Enhance** with discovered patterns and hierarchical references
  - **Add** references to new subdirectory AGENTS.md files
- If subdirectory `AGENTS.md` already exists:
  - **Read it first** and preserve valuable content
  - **Merge** new discoveries with existing content
- If no AGENTS.md exists anywhere: create fresh

## Analysis Tools Reference

### Pattern Extraction Commands

```bash
# TypeScript/JavaScript imports
timeout 5s find . -name "*.ts" -o -name "*.tsx" 2>/dev/null \
  | grep -v node_modules | head -20 \
  | xargs grep -h "^import" 2>/dev/null | sort -u | head -30

# Python imports
timeout 5s find . -name "*.py" 2>/dev/null | grep -v venv | head -20 \
  | xargs grep -h "^import\|^from" 2>/dev/null | sort -u | head -30

# Go imports
timeout 5s find . -name "*.go" 2>/dev/null | head -20 \
  | xargs grep -h "import" 2>/dev/null | sort -u | head -30

# Function/class definitions
timeout 5s find . -name "*.ts" 2>/dev/null | grep -v node_modules | head -10 \
  | xargs grep -E "^export (function|class|const)" 2>/dev/null | head -50

# Recent commit patterns
timeout 5s git log --oneline --no-merges -30 2>/dev/null

# Configuration files
timeout 5s find . -maxdepth 2 -name "*.config.*" -o -name ".eslintrc*" \
  -o -name "tsconfig*" -o -name "pyproject.toml" 2>/dev/null
```

## Error Handling

### Tool Failures

- If a tool fails, try alternatives (Read -> Bash cat, Grep -> Bash grep)
- If ALL tools fail on a section, write "Analysis incomplete: [reason]"
- Never fabricate examples — write "No examples found" instead

### Pattern Ambiguities

- If patterns are inconsistent, document both and note the inconsistency
- If no linter/formatter found, note it as a potential improvement
- If multiple test frameworks detected, list all

## Completion Criteria

Before providing the summary, validate:

- [ ] Root AGENTS.md exists with all 6 required sections
- [ ] All code blocks are properly closed
- [ ] No placeholders (`[TODO]`, `[FIXME]`, `[INSERT_HERE]`)
- [ ] Commands are real (verified from project configuration)
- [ ] Subdirectory AGENTS.md files are concise (50-150 lines each)
- [ ] Subdirectory files don't repeat root-level content
- [ ] File paths with line numbers for all code examples

After validation, provide a brief summary:

1. **Files created**: List all AGENTS.md files with locations
2. **Project type and stack**: Primary language/framework identified
3. **Key patterns extracted**: With file references
4. **Validation rules documented**: Count of linter rules, formatter settings
5. **Any gaps or ambiguities**: That need human clarification

**CRITICAL: After writing all AGENTS.md files and providing the summary, STOP.**
Do not proceed with implementation.

## Output Quality Guidelines

1. **Be Concrete**: Use actual code, not placeholders
2. **Be Explicit**: "Functions use camelCase" not "follow naming conventions"
3. **Show Examples**: Every pattern needs real code from the project
4. **Include Anti-Patterns**: Show what NOT to do with reasoning
5. **Make it Scannable**: Tables, code blocks, clear headers
6. **Reference Files**: Point to specific files as examples
7. **Extract, Don't Infer**: Base patterns on actual code in the repository

## Common Pitfalls to Avoid

- Do NOT read files in node_modules, .git, dist, build, vendor, target
- Do NOT fabricate code examples
- Do NOT write vague descriptions like "follows best practices"
- Do NOT include sensitive data from .env files (only .env.example)
- Do NOT generate more than 500 lines for root AGENTS.md
- Do NOT continue after tool timeouts — skip gracefully
