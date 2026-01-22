---
description: AI-optimized project initialization with concrete code analysis
agent: general
model: github-copilot/claude-sonnet-4.5
subtask: true
---

Perform a comprehensive project initialization optimized for AI coding agents.
Create a detailed AGENTS.md file with concrete code examples, explicit patterns,
validation rules, and actionable guidelines extracted from the actual codebase.

## Analysis Strategy

This command uses a **hybrid approach** combining:

1. **Shell commands** - Fast file discovery and config parsing
2. **Serena MCP tools** - Deep semantic code analysis (if available)

**Serena Integration**: If Serena MCP is available, use it for symbol-level
analysis, reference tracking, and pattern extraction. If Serena fails or is not
available, gracefully fall back to basic Read/Write tools and shell commands for
text-based analysis.

**Fallback Strategy**:

- Try Serena tools first for semantic analysis
- If Serena fails (errors, timeouts, not configured), immediately fall back to:
  - Read tool for file contents
  - Grep tool for pattern searching  
  - Shell commands for text extraction
- Never fail the entire analysis if Serena is unavailable
- Silently degrade to text-based analysis without interrupting the user

## Analysis Instructions

Analyze this project to create AI-actionable documentation with concrete
examples, not abstract descriptions.

### 1. Project Overview & Tech Stack

**Goal**: Give AI agents immediate context about what this project does and what
it's built with.

Extract:

- Project type (library/application/service/tool/infrastructure)
- Primary use case and domain
- Core technologies with exact versions
- Runtime requirements
- Package manager and key dependencies

### 2. File Structure & Placement Rules

**Goal**: AI agents need to know exactly where to put new files.

Analyze the directory structure and create explicit file placement rules:

- Where do different file types live?
- What naming patterns are used? (PascalCase, camelCase, kebab-case)
- Are tests colocated or in separate directories?
- Where do utilities, types, constants go?

Create a table format for quick lookup.

### 3. Code Patterns with Concrete Examples

**Goal**: AI agents learn by example, not description.

**Method**: Use Serena MCP for semantic analysis if available, shell commands
otherwise.

**Serena Tools (Preferred)**:

- `serena_get_symbols_overview` on key source files to map all classes,
  functions, types
- `serena_find_symbol` with substring matching to find pattern categories (e.g.,
  " *Service", "*Error", "*Test")
- `serena_find_referencing_symbols` to understand how patterns are actually used
  in practice

**Shell Fallback**:
Extract actual code snippets showing:

- Function/class definition patterns
- Import statement patterns
- Error handling patterns
- Async/await usage
- State management patterns
- Common utility usage

Use format:

```text
✅ DO THIS (with actual code from codebase)
❌ DON'T DO THIS (common anti-patterns)
```

### 4. Tool Configuration & Validation Rules

**Goal**: AI agents must know what validation they'll face.

Parse and explicitly document:

- Linter rules that are enabled (ESLint, Ruff, etc.)
- Formatter settings (line length, quotes, trailing commas, etc.)
- Type checking strictness (TypeScript strict mode, Python type hints)
- Pre-commit hooks that will run
- CI/CD checks that must pass

### 5. Testing Patterns with Examples

**Goal**: AI agents need to know exactly how to write tests.

**Method**: Serena MCP for symbol-level test analysis, fallback to Read/Shell.

**Serena Tools (Preferred)**:

- `serena_find_file` to locate test files (*.test.ts, test_*.py, etc.)
- `serena_read_file` to get complete test file contents with proper formatting
- `serena_get_symbols_overview` on test files to understand test structure
- `serena_search_for_pattern` to find setup/teardown patterns (beforeEach,
  setUp, etc.)

**Fallback (Read/Shell)**:

- Use Glob tool to find test files
- Use Read tool to get test file contents
- Use Shell commands to extract patterns

Extract from actual test files:

- Test file naming pattern
- Test structure (describe/it, test(), etc.)
- Setup/teardown patterns
- Mocking patterns
- Assertion style
- Coverage requirements

Include actual test code examples.

### 6. Code Style Enforcement

**Goal**: Document the actual enforced rules, not preferences.

Extract:

- Configured linting rules
- Formatter configuration
- Naming conventions that are validated
- Import organization rules
- Type annotation requirements

### 7. Common Workflows & Commands

**Goal**: AI agents need to know how to validate their changes.

Document exact commands for:

- Installing dependencies
- Running development server
- Running tests (unit, integration, e2e)
- Linting and formatting
- Building for production
- Running CI locally

### 8. Architectural Constraints & Decisions

**Goal**: AI agents need to understand WHY, not just WHAT.

Document:

- Key architectural decisions and rationale
- Performance constraints
- Security requirements
- Scalability considerations
- Technical debt to avoid perpetuating

### 9. Change Patterns from Git History

**Goal**: Show AI agents how changes are actually made.

Analyze recent commits to show:

- Common types of changes
- How refactoring is approached
- Migration patterns
- Breaking change handling

## Serena MCP Analysis (If Available)

**IMPORTANT**: Attempt these Serena operations first. If any fail, immediately
fall back to Read/Grep/Shell tools without failing the entire analysis.

### Symbol Overview Analysis

Use `serena_get_symbols_overview` on key files to understand:

- Class hierarchies and relationships
- Function signatures and patterns
- Type definitions and interfaces
- Module organization

Example files to analyze (language-dependent):

- Main entry point (index.ts, main.py, main.go)
- Core domain models
- Service/controller classes
- Utility modules

### Pattern Discovery with Serena

Use `serena_find_symbol` with substring matching to find pattern families:

**TypeScript/JavaScript**:

- `serena_find_symbol "*Service"` - Find all service classes
- `serena_find_symbol "*Controller"` - Find all controllers
- `serena_find_symbol "*Error"` - Find custom error classes
- `serena_find_symbol "*Hook"` - Find React hooks
- `serena_find_symbol "*Props"` - Find component prop types

**Python**:

- `serena_find_symbol "*Service"` - Service classes
- `serena_find_symbol "*Error"` - Custom exceptions
- `serena_find_symbol "test_*"` - Test functions
- `serena_find_symbol "*Manager"` - Manager classes

**Go**:

- `serena_find_symbol "*Handler"` - HTTP handlers
- `serena_find_symbol "*Service"` - Service interfaces
- `serena_find_symbol "*Error"` - Error types

### Usage Pattern Analysis

For key symbols found above, use `serena_find_referencing_symbols` to:

- See how patterns are actually used
- Understand dependency injection patterns
- Identify common usage mistakes to document as anti-patterns
- Extract real-world usage examples for documentation

### Code Pattern Extraction

Use `serena_search_for_pattern` to find:

- Error handling: `try.*catch` or `except.*:`
- Async patterns: `async.*await` or `\.then\(`
- Logging patterns: `log\.|logger\.|console\.`
- Database queries: `query|select|insert|update|delete` (context-dependent)

### File Reading with Serena

Use `serena_read_file` for:

- Complete test file contents (better formatting than cat)
- Configuration files (package.json, tsconfig.json, etc.)
- Example implementation files

**Fallback on ANY Serena Failure**: Use Read, Grep, Glob, and Shell tools
instead.

## Project Context Collection

**Note**: These shell commands serve as the fallback layer when Serena MCP is
unavailable or fails. They provide text-based analysis for all sections above.

### Core Files and Configuration

!
`find . -maxdepth 2 -type f \( -name "package.json" -o -name "tsconfig.json" -o -name "pyproject.toml" -o -name "requirements.txt" -o -name "go.mod" -o -name "Cargo.toml" \) 2>/dev/null`

!`cat package.json 2>/dev/null | head -150`

!`cat pyproject.toml 2>/dev/null | head -150`

!`cat tsconfig.json 2>/dev/null | head -100`

### Directory Structure

!`find . -maxdepth 3 -type d -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/dist/*' -not -path '*/build/*' -not -path '*/__pycache__/*' -not -path '*/venv/*' -not -path '*/.venv/*' | sort | head -100`

### Linting and Formatting Configuration

!`cat .eslintrc* .eslintrc.json .eslintrc.js .eslintrc.yml 2>/dev/null | head -200`

!`cat .prettierrc* .prettierrc.json prettier.config.js 2>/dev/null | head -100`

!`cat .ruff.toml 2>/dev/null || cat pyproject.toml 2>/dev/null | grep -A 100 "\[tool.ruff\]"`

!`cat .pylintrc setup.cfg 2>/dev/null | head -100`

### Git Configuration and Pre-commit Hooks

!`cat .pre-commit-config.yaml .husky/* .git/hooks/pre-commit 2>/dev/null | head -100`

!`cat .github/workflows/*.yml .github/workflows/*.yaml 2>/dev/null | head -200`

### README and Documentation

!`cat README.md 2>/dev/null | head -150`

!`cat CONTRIBUTING.md docs/DEVELOPMENT.md 2>/dev/null | head -100`

### Source Code Examples (for pattern extraction)

!`find . -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \) -not -path "*/node_modules/*" -not -path "*/dist/*" -not -path "*/build/*" | head -10 | while read f; do echo "=== $f ==="; head -80 "$f"; done`

!`find . -type f \( -name "*.py" \) -not -path "*/venv/*" -not -path "*/__pycache__/*" -not -path "*/dist/*" | head -10 | while read f; do echo "=== $f ==="; head -80 "$f"; done`

### Import Patterns Analysis

!`find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | grep -v node_modules | head -30 | xargs grep -h "^import" 2>/dev/null | sort -u | head -50`

!`find . -name "*.py" | grep -v venv | grep -v __pycache__ | head -20 | xargs grep -h "^import\|^from" 2>/dev/null | sort -u | head -50`

### Test Examples (for pattern extraction)

!`find . -type f \( -name "*.test.ts" -o -name "*.test.tsx" -o -name "*.test.js" -o -name "*.spec.ts" -o -name "*.spec.js" \) -not -path "*/node_modules/*" | head -5 | while read f; do echo "=== $f ==="; head -100 "$f"; done`

!`find . -type f -name "test_*.py" -o -name "*_test.py" | grep -v venv | head -5 | while read f; do echo "=== $f ==="; head -100 "$f"; done`

### Error Handling Patterns

!`find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" | grep -v node_modules | head -20 | xargs grep -A 5 "try {" 2>/dev/null | head -100`

!`find . -name "*.py" | grep -v venv | head -20 | xargs grep -A 5 "try:" 2>/dev/null | head -100`

### Function/Class Definition Patterns

!`find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | head -15 | xargs grep -E "^export (function|class|const|interface|type)" 2>/dev/null | head -80`

!`find . -name "*.py" | grep -v venv | head -15 | xargs grep -E "^def |^class |^async def " 2>/dev/null | head -80`

### Recent Git History (for change patterns)

!`git log --oneline --no-merges -30 2>/dev/null`

!`git log --pretty=format:"%h %s" --no-merges -20 --name-only 2>/dev/null | head -100`

### Build and Test Scripts

!`cat package.json 2>/dev/null | grep -A 50 "\"scripts\""`

!`cat Makefile 2>/dev/null | head -100`

!`cat justfile 2>/dev/null | head -100`

## AGENTS.md Structure (AI-Optimized Format)

Create an AGENTS.md file with this structure optimized for AI agent consumption:

### Quick Reference Section

A concise table with immediate lookup information:

- Primary language and version
- Framework and version
- Package manager
- Test command
- Lint command
- Format command
- Build command

### File Placement Rules

A table showing exactly where different file types go:
| File Type | Directory | Naming Pattern | Example |
Format: concrete, no ambiguity.

### Code Patterns & Examples

Actual code snippets extracted from the codebase showing:

- How to define functions/classes
- How to handle errors
- How to write async code
- How to import modules
- Use ✅ DO THIS / ❌ DON'T DO THIS format with real code

### Testing Patterns

Actual test code showing:

- Test file structure
- Setup/teardown
- Mocking patterns
- Assertion style

Include full test examples, not summaries.

### Validation & Quality Gates

Explicit list of what will be checked:

- Linter rules enabled (list the important ones)
- Formatter settings (line length, quotes, etc.)
- Type checking requirements
- Pre-commit hooks
- CI checks

### Common Commands

Copy-pasteable commands for:

- Setup: `npm install` or `pip install -e .`
- Dev: `npm run dev` or `python -m app`
- Test: `npm test` or `pytest`
- Lint: `npm run lint` or `ruff check .`
- Format: `npm run format` or `ruff format .`
- Build: `npm run build` or `python -m build`

### Import Patterns

Show the actual import patterns used:

- How are relative imports done?
- How are external dependencies imported?
- What's the import order?

Include 10-15 real examples from the codebase.

### Architecture & Constraints

- Key architectural decisions and WHY
- Performance constraints
- Security requirements
- What NOT to do and why

### Recent Change Patterns

Show 5-10 recent commits as examples of how changes are made.

## Output Guidelines for AI Agents

1. **Be Concrete**: Use actual code from the codebase, not placeholders
2. **Be Explicit**: "Functions use camelCase" not "follow naming conventions"
3. **Show Examples**: Every pattern should have a real code example
4. **Include Anti-Patterns**: Show what NOT to do with examples
5. **Make it Scannable**: Use tables, code blocks, clear headers
6. **Include Validation**: Document what checks will run and fail
7. **Provide Templates**: Show actual code that can be copied
8. **Reference Files**: Point to specific files as examples
9. **Extract, Don't Infer**: Use actual patterns from the code
10. **Update Commands**: Only include commands that actually work

After creating AGENTS.md, provide a summary with:

- Primary language and framework identified
- Key patterns extracted (with file references)
- Validation rules documented
- Testing approach identified
- Any ambiguities or missing patterns that need clarification
- Suggested improvements to codebase consistency
