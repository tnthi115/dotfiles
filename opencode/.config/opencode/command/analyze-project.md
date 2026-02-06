---
description: AI-optimized project initialization with concrete code analysis
agent: general
model: f5/claude-sonnet-4-5
subtask: true
---

# Deep Project Initialization

Perform a comprehensive project initialization optimized for AI coding
agents. Create a detailed AGENTS.md file with concrete code examples,
explicit patterns, validation rules, and actionable guidelines extracted
from the actual codebase.

## Execution Instructions

🛑 **CRITICAL: Your ONLY task is to analyze this project and create a
comprehensive AGENTS.md file, then STOP.**

**What you MUST do:**

- Analyze the project using available tools
- Create a single file: `AGENTS.md` in the project root
- Provide a brief summary when complete

**What you MUST NOT do:**

- ❌ Do NOT implement features or refactor code
- ❌ Do NOT create additional files beyond AGENTS.md
- ❌ Do NOT modify existing code or configurations
- ❌ Do NOT run builds, tests, or deployment commands

Your job is complete once AGENTS.md is written and summarized.

## Analysis Strategy

Use the following tools to gather information about the project:

### Preferred Tools (Use First)

1. **Serena MCP tools** (if available):
   - `serena_get_symbols_overview` - Get file structure and symbols
   - `serena_find_symbol` - Find classes, functions, patterns
   - `serena_find_referencing_symbols` - Understand usage patterns
   - `serena_search_for_pattern` - Find code patterns
   - `serena_read_file` - Read configuration and source files

2. **If Serena fails or is unavailable**, use:
   - `Read` tool for file contents
   - `Grep` tool for pattern searching
   - `Glob` tool for file discovery
   - `Bash` tool for shell commands

### Fallback Strategy

- Try Serena tools first for semantic analysis
- If ANY Serena operation fails (timeout, error, not configured):
  - Immediately fall back to Read/Grep/Glob/Bash
  - Continue analysis without interruption
  - Do NOT stop to report Serena failures - handle gracefully
- If ALL tools fail on a section, document "Analysis incomplete: [reason]"
- Gracefully degrade to text-based analysis

## What to Analyze

### 1. Project Overview & Tech Stack

**Use these tools to discover project type:**

- Read `package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `pom.xml`
- Read `README.md` for project description
- Check for framework files (`next.config.js`, `vite.config.ts`, `setup.py`,
  etc.)

**Extract:**

- Project type (library/application/service/tool/infrastructure)
- Primary use case and domain
- Core technologies with exact versions
- Runtime requirements
- Package manager and key dependencies

### 2. File Structure & Placement Rules

**Use Bash or Glob to map directory structure:**

```bash
timeout 10s find . -maxdepth 3 -type d \
  -not -path '*/node_modules/*' \
  -not -path '*/.git/*' \
  -not -path '*/dist/*' \
  -not -path '*/build/*' \
  -not -path '*/__pycache__/*' \
  -not -path '*/venv/*' \
  -not -path '*/.venv/*' \
  -not -path '*/.next/*' \
  -not -path '*/.turbo/*' 2>/dev/null | sort
```

**Document:**

- Where different file types live (components, utils, tests, configs)
- Naming patterns (PascalCase, camelCase, kebab-case, snake_case)
- Test file location (colocated vs separate directories)
- Create a table for quick lookup

### 3. Code Patterns with Concrete Examples

**Use Serena (preferred) or Read/Grep to extract:**

**Pattern Discovery:**

- Function/class definition patterns (find actual examples)
- Import statement patterns (collect 10-15 real examples)
- Error handling patterns (try/catch, try/except usage)
- Async/await usage patterns
- State management patterns

**For each pattern, use this format:**

```text
✅ DO THIS (actual code from codebase)
❌ DON'T DO THIS (common anti-patterns)
```

**Shell command fallback for pattern extraction:**

```bash
# TypeScript/JavaScript imports (with timeout protection)
timeout 5s find . -name "*.ts" -o -name "*.tsx" 2>/dev/null \
  | grep -v node_modules | head -20 \
  | xargs grep -h "^import" 2>/dev/null | sort -u | head -30

# Python imports
timeout 5s find . -name "*.py" 2>/dev/null | grep -v venv | head -20 \
  | xargs grep -h "^import\|^from" 2>/dev/null | sort -u | head -30

# Function definitions
timeout 5s find . -name "*.ts" 2>/dev/null | grep -v node_modules | head -10 \
  | xargs grep -E "^export (function|class|const)" 2>/dev/null | head -50
```

### 4. Tool Configuration & Validation Rules

**Read these configuration files:**

- `.eslintrc*`, `eslint.config.js` - ESLint rules
- `.prettierrc*`, `prettier.config.js` - Prettier settings
- `tsconfig.json` - TypeScript strict mode settings
- `pyproject.toml` - Python tool configurations (ruff, mypy, pytest)
- `.pre-commit-config.yaml` - Pre-commit hooks
- `.github/workflows/*.yml` - CI/CD checks

**Document explicitly:**

- Linter rules enabled (list important ones)
- Formatter settings (line length, quotes, trailing commas)
- Type checking strictness
- Pre-commit hooks that will run
- CI/CD checks that must pass

### 5. Testing Patterns with Examples

**Find test files using Glob or Serena:**

- `*.test.ts`, `*.test.tsx`, `*.test.js`, `*.spec.ts`, `*.spec.js`
- `test_*.py`, `*_test.py`
- `*_test.go`

**Read actual test files and extract:**

- Test file naming pattern
- Test structure (describe/it, test(), etc.)
- Setup/teardown patterns (beforeEach, setUp, fixtures)
- Mocking patterns (jest.mock, unittest.mock, etc.)
- Assertion style (expect(), assert, etc.)
- Coverage requirements

**Include full test examples** from the codebase, not summaries.

### 6. Code Style Enforcement

**Parse configuration files to document:**

- Line length limits
- Quote style (single, double)
- Indentation (spaces vs tabs, size)
- Trailing commas
- Semicolons (required/forbidden)
- Import organization rules
- Naming conventions enforced by linters

### 7. Common Workflows & Commands

**Extract from package.json scripts or Makefile:**

```bash
# Read package.json scripts
cat package.json | grep -A 50 "\"scripts\""

# Check for Makefile
cat Makefile | head -100
```

**Document exact commands for:**

- Installing dependencies (`npm install`, `pip install -e .`)
- Running development server (`npm run dev`, `python -m app`)
- Running tests (`npm test`, `pytest`, `go test ./...`)
- Linting (`npm run lint`, `ruff check .`)
- Formatting (`npm run format`, `ruff format .`)
- Building (`npm run build`, `python -m build`)

### 8. Git History Analysis

**Use Bash to analyze recent commits:**

```bash
# Recent commit messages (for conventional commit patterns)
timeout 5s git log --oneline --no-merges -30 2>/dev/null || echo "Git analysis skipped"

# Files commonly changed together
timeout 5s git log --pretty=format:"%h %s" --no-merges -20 --name-only \
  2>/dev/null | head -100
```

**Document:**

- Commit message patterns (conventional commits, custom format)
- Common types of changes
- Refactoring patterns observed

### 9. Security Patterns

**Read security-related files:**

- `.env.example` - Required environment variables (never read actual `.env`)
- `middleware/*` - Authentication/authorization middleware
- Server configuration files (express, fastify, next.config.js)
- Input validation schemas (zod, joi, yup)

**Search for security patterns:**

```bash
# Find authentication patterns
grep -r "authenticate\|authorize\|jwt\|passport" --include="*.ts" \
  --include="*.js" src/ | head -20

# Find input validation
grep -r "validate\|schema\|sanitize" --include="*.ts" \
  --include="*.js" src/ | head -20
```

**Document:**

- Authentication strategy (JWT, sessions, OAuth, etc.)
- Authorization patterns (RBAC, ABAC, middleware)
- Input validation approach
- CORS configuration
- Rate limiting implementation
- Common vulnerabilities to avoid in this codebase

### 10. Dependency Management

**Analyze dependency files:**

- `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock` - Lock file type
- `pyproject.toml`, `requirements.txt`, `Pipfile.lock` - Python deps
- `go.mod`, `go.sum` - Go modules
- `Cargo.lock` - Rust dependencies

**Document:**

- Lock file type and package manager version requirements
- Critical dependencies and their purposes (e.g., "react 18.2.0 for UI")
- Peer dependency requirements
- Monorepo tooling if present (nx, turborepo, lerna, pnpm workspaces)
- Dependency update strategy (dependabot config, renovate)

### 11. API & Integration Patterns

**Search for API patterns:**

```bash
# Find API client patterns
grep -r "fetch\|axios\|tRPC" --include="*.ts" \
  --include="*.js" src/ | head -20

# Find database patterns
grep -r "prisma\|sequelize\|typeorm\|mongoose" --include="*.ts" \
  src/ | head -20
```

**Document:**

- API client pattern (fetch, axios, tRPC, GraphQL client)
- Database ORM/query builder (Prisma, TypeORM, Sequelize, Drizzle)
- Data fetching patterns (SWR, React Query, server components)
- WebSocket/real-time patterns
- Third-party service integrations (Stripe, Auth0, SendGrid)
- Error handling for external calls (retry logic, circuit breakers)

## AGENTS.md Structure

Create an AGENTS.md file with these 11 sections in order:

**REQUIRED (all projects):**

1. **Quick Reference** - Table with language, framework, package manager,
   commands
2. **File Placement Rules** - Table showing where different file types belong
3. **Code Patterns & Examples** - DO/DON'T format with real code + reasoning
4. **Testing Patterns** - Complete test file examples with setup/assertions
5. **Validation & Quality Gates** - Linter rules, formatter settings, CI checks
6. **Common Commands** - Copy-pasteable development workflow commands

**IF APPLICABLE (skip if not relevant):**

1. **Import Patterns** - 10-15 actual import statements from the codebase
2. **Architecture & Constraints** - Key architectural decisions with rationale
3. **Security Patterns** - Auth, validation, CORS (web applications)
4. **Dependency Management** - Lock files, critical dependencies (monorepos,
   complex setups)
5. **API & Integration Patterns** - API clients, database, data fetching
   (services/apps)

Each section uses concrete examples from the actual codebase (not placeholders).
See detailed templates below:

### 1. Quick Reference Table

Use this exact format with real values from the project:

```text
| Setting | Value |
|---------|-------|
| Language | TypeScript 5.3.3 |
| Framework | Next.js 14.0.4 |
| Package Manager | pnpm 8.10.0 |
| Test Command | `pnpm test` |
| Lint Command | `pnpm lint` |
| Format Command | `pnpm format` |
| Build Command | `pnpm build` |
```

### 2. File Placement Rules

Use this table format with real examples from the project:

```text
| File Type | Directory | Naming Pattern | Example |
|-----------|-----------|----------------|---------|
| Components | src/components | PascalCase.tsx | UserProfile.tsx |
| Utils | src/utils | camelCase.ts | formatDate.ts |
| Tests | __tests__ | *.test.ts | UserProfile.test.ts |
| E2E Tests | e2e/ | *.spec.ts | login.spec.ts |
| Config | config/ | kebab-case.ts | database.config.ts |
| Types | src/types | PascalCase.ts | User.ts |
| Hooks | src/hooks | use*.ts | useAuth.ts |
| API Routes | pages/api | kebab-case.ts | user-profile.ts |
```

### 3. Code Patterns & Examples

Include actual code snippets with DO/DON'T format and reasoning.
Each pattern should show real code from the codebase with explicit explanations.

**Example format for each pattern:**

#### Function Definitions

**✅ DO THIS:**

```typescript
export function formatDate(date: Date): string {
  return date.toISOString().split("T")[0];
}
```

**Why:** Explicit return type, clear parameter type, single responsibility,
properly exported

**❌ DON'T DO THIS:**

```typescript
function formatDate(date: any) {
  return date.toISOString().split("T")[0];
}
```

**Why:** Uses `any` type, missing return type annotation, not exported

Repeat this pattern for: imports, error handling, async code, state management.

### 4. Testing Patterns

Include complete test examples showing actual test file content with:

- imports
- setup/teardown
- test cases
- assertions

### 5. Validation & Quality Gates

Use this structure:

```text

```

```text
#### Linting Rules

- no-unused-vars: Disallow unused variables
- @typescript-eslint/explicit-function-return-type: Require return types

#### Formatter Settings

- Line length: 88
- Quotes: single
- Trailing commas: es5
- Semicolons: required

#### CI/CD Checks

1. Type checking (tsc --noEmit)
2. Linting (eslint .)
3. Unit tests (jest)
4. Integration tests (playwright)
```

### 6. Common Commands

Provide exact copy-pasteable commands:

```text

```

```text
#### Development Workflow

# Install dependencies
npm install

# Run dev server
npm run dev

# Run tests
npm test

# Lint code
npm run lint

# Format code
npm run format

# Build for production
npm run build
```

### 7. Import Patterns

Show 10-15 actual import statements from the codebase. Example format:

```text
#### Import Examples

// React imports
import React, { useState, useEffect } from 'react';

// Component imports
import { Button } from '@/components/ui/button';

// Utility imports
import { formatDate } from '@/utils/formatDate';

// Type imports
import type { User } from '@/types';
```

### 8. Architecture & Constraints

Document key decisions with rationale using this structure:

```text
#### Key Architectural Decisions

- **State Management**: Using Redux Toolkit for global state because it
  provides type safety, DevTools, and standardized patterns for the team
- **API Layer**: REST with axios instead of GraphQL due to simpler caching
  requirements and existing backend infrastructure
- **Authentication**: JWT tokens in httpOnly cookies for security against
  XSS attacks, with refresh token rotation

#### Performance Constraints

- API response time must be < 200ms (SLA requirement)
- Bundle size target: < 500KB gzipped (core web vitals)
- Lighthouse score > 90 for all pages
- Database queries must use indexes (no table scans)

#### Anti-Patterns to Avoid

- ❌ Don't use `any` type - breaks type safety and IDE autocomplete
- ❌ Don't mutate Redux state directly - use reducers/immer
- ❌ Don't fetch data in components - use React Query hooks
- ❌ Don't hardcode API URLs - use environment variables
- ❌ Don't skip error boundaries - causes poor UX on crashes
```

### 9. Security Patterns (if applicable)

```text
#### Authentication & Authorization

- Strategy: JWT with httpOnly cookies + refresh tokens
- Authorization: Role-based (RBAC) with middleware checks
- Session management: Redis-backed with 24hr expiry

#### Input Validation

- All API inputs validated with Zod schemas
- SQL injection prevented via Prisma ORM (parameterized queries)
- XSS prevention: DOMPurify for user-generated content

#### Security Headers

- CORS: Configured in middleware with whitelist
- CSP: Strict Content Security Policy enabled
- Rate limiting: 100 req/min per IP via express-rate-limit

#### Secrets Management

- Never commit .env files (use .env.example template)
- Production secrets in environment variables
- API keys rotated quarterly
```

### 10. Dependency Management (if applicable)

```text
#### Lock Files & Package Manager

- Package manager: pnpm 8.10.0 (required for workspace features)
- Lock file: pnpm-lock.yaml (must be committed)
- Node version: >=18.17.0 (specified in .nvmrc)

#### Critical Dependencies

- react@18.2.0 - UI framework
- next@14.0.4 - SSR/routing framework
- prisma@5.7.0 - Database ORM
- zod@3.22.4 - Runtime validation

#### Monorepo Structure

- Tool: Turborepo for build orchestration
- Workspaces: apps/*, packages/*
- Shared packages: @repo/ui, @repo/config, @repo/tsconfig

#### Dependency Updates

- Automated: Renovate bot creates weekly PRs
- Process: Review changelog, test locally, merge
- Breaking changes: Require team discussion before upgrade
```

### 11. API & Integration Patterns (if applicable)

```text
#### API Client Patterns

- Primary: tRPC for type-safe client-server communication
- External APIs: axios with interceptors for auth/retry
- Error handling: Custom error classes with retry logic

#### Database Patterns

- ORM: Prisma with PostgreSQL
- Migrations: Run via prisma migrate before deployment
- Transactions: Use interactive transactions for multi-step operations
- Query optimization: Always use select to limit fields

#### Data Fetching Patterns

- Server components: Direct database queries (Next.js 13+)
- Client components: TanStack Query for caching/revalidation
- Real-time: WebSocket via Socket.io for chat features
- Polling: Avoided in favor of webhooks or SSE

#### External Integrations

- Payment: Stripe SDK with webhook verification
- Auth: NextAuth.js with Google/GitHub providers
- Email: SendGrid API with template management
- Storage: AWS S3 via signed URLs (no direct uploads)
```

## Completion Criteria

Before providing the summary, validate AGENTS.md quality:

- **Markdown syntax**: Verify all ``` code blocks are properly closed
- **No placeholders**: Ensure no `[brackets]`, `TODO`, or `FIXME` remain
- **Table formatting**: Check all tables have proper `|` alignment
- **Minimum quality**: File should be > 100 lines with substantial content
- **Required sections**: Verify all 6 REQUIRED sections (1-6) are present with
  content

After validation passes, provide a brief summary containing:

1. **Primary language and framework identified**
2. **Key patterns extracted** (with file references)
3. **Validation rules documented** (count of linter rules, formatter settings)
4. **Testing approach identified** (framework, style, coverage requirements)
5. **Any ambiguities or missing patterns** that need human clarification
6. **Suggested improvements** to codebase consistency

**CRITICAL: After saving AGENTS.md and providing the summary, STOP.**

🛑 **Do not proceed with implementation. Your task is complete.**

## Output Quality Guidelines

1. **Be Concrete**: Use actual code from the codebase, not placeholders like
   `[Language + Version]` - use real values like `TypeScript 5.3.3`
2. **Be Explicit**: Write "Functions use camelCase" not "follow naming
   conventions"
3. **Show Examples**: Every pattern must have real code examples from the
   project with proper syntax highlighting
4. **Include Anti-Patterns**: Show what NOT to do with examples and explain WHY
   with specific reasoning
5. **Make it Scannable**: Use tables, code blocks, clear headers, emojis (✅/❌)
   for quick reference
6. **Include Validation**: Document what checks will run and what they enforce
   (e.g., "ESLint enforces no-unused-vars")
7. **Provide Templates**: Show actual code that can be copied and modified by
   other agents
8. **Reference Files**: Point to specific files as pattern examples with line
   numbers (e.g., `src/utils/formatDate.ts:15-20`)
9. **Extract, Don't Infer**: Base all patterns on actual code in the repository,
   not assumptions
10. **Update Commands**: Only include commands that actually exist and work
    (verify in package.json scripts)
11. **Use Project Tools**: If `.opencode/opencode.jsonc` exists, document the
    configured LSP servers and formatters for this project so agents know which
    tools to use for validation

## Common Pitfalls to Avoid

**❌ Don't:**

- Read files in `node_modules`, `.git`, `dist`, or `build` directories (wastes
  time, causes timeouts)
- Fabricate code examples - use "No examples found in codebase" if none exist
- Write vague descriptions like "follows best practices" - be specific with
  actual rules
- Include sensitive data from `.env` files - only read `.env.example`
- Generate > 500 line AGENTS.md - keep focused and scannable for agents
- Use placeholder text like `[TODO]`, `[INSERT_HERE]`, or `[Language + Version]`
- Continue after timeouts - if command fails, skip gracefully and document

**✅ Do:**

- Sample representative files if repo has > 100 files
- Verify commands exist in package.json before documenting them
- Use actual version numbers from package.json/pyproject.toml
- Include file paths with line numbers for all code examples (e.g.,
  `src/utils/formatDate.ts:15-20`)
- Write actionable guidance that other agents can immediately apply
- Skip optional sections (7-11) if not applicable rather than forcing content

## Error Handling

### File Access Errors

- If a configuration file doesn't exist, note it and try alternatives (e.g.,
  `.eslintrc.json` → `.eslintrc.js` → `eslint.config.js`)
- If a directory is inaccessible, document the limitation in summary
- If `.env.example` is missing, note that environment variables may be
  undocumented

### Tool Failures

- If Serena fails, immediately fall back to Read/Grep/Bash without logging
- If Read fails, try Bash `cat` command as last resort
- If Grep fails, try Bash `grep` or manual file scanning
- If ALL tools fail on a critical section (e.g., package.json), document
  "Analysis incomplete: [tool] failed"

### Pattern Extraction Failures

- If no examples found for a pattern, explicitly write "No examples found in
  codebase" rather than fabricating examples
- If only 1-2 examples found when 10+ requested, include what's available and
  note "Limited examples found"
- If patterns are inconsistent, document both patterns and note the
  inconsistency

### Configuration Ambiguities

- If ESLint and Prettier have conflicting settings, document both and note the
  conflict
- If multiple test frameworks detected, list all and recommend
  consolidation
- If no linter/formatter found, note "No linter configured - recommend adding
  ESLint"
- If TypeScript strict mode is disabled, note it as a potential improvement

**Remember: Create AGENTS.md and STOP. Do not implement anything.**
