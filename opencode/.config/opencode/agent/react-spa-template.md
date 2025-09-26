---
description: This subagent should only be called manually by the user.
mode: subagent
model: github-copilot/claude-sonnet-4
tools:
  bash: true
  read: true
  write: false
  glob: true
  grep: true
  list: true
  webfetch: true
permission:
  bash:
    "node *": "allow"
    "npm *": "allow"
    "npx *": "allow"
    "yarn *": "allow"
    "pnpm *": "allow"
    "bun *": "allow"
    "vite *": "allow"
    "docker *": "allow"
    "make *": "allow"
    "git *": "allow"
    "find *": "allow"
    "grep *": "allow"
    "rg *": "allow"
    "cat *": "allow"
    "head *": "allow"
    "tail *": "allow"
    "wc *": "allow"
    "ls *": "allow"
    "test *": "allow"
    "*": "ask"
  webfetch: "allow"
  write: "deny"
---

# React SPA Project Template

This template provides a foundation for analyzing React Single Page Applications and generating optimized AGENTS.md files specific to React projects.

## Project Detection Criteria

A project is classified as React SPA if it has:
- `package.json` with `react` dependency
- Typical React project structure (`src/`, `public/`)
- Common React build tools (Vite, Create React App, or custom Webpack)

```bash
# Detection command
test -f package.json && grep -q '"react"' package.json
```

## Technology Stack Analysis

### Core Dependencies to Check
```json
{
  "react": "^18.0.0",
  "react-dom": "^18.0.0",
  "@types/react": "^18.0.0",
  "typescript": "^4.0.0"
}
```

### Build Tools to Identify
- **Vite**: `vite.config.js`, `vite.config.ts`
- **Create React App**: `react-scripts` in dependencies
- **Custom Webpack**: `webpack.config.js`
- **Next.js**: `next.config.js` (hybrid SPA/SSR)

### State Management Libraries
- Redux: `@reduxjs/toolkit`, `redux`
- Zustand: `zustand`
- React Query: `@tanstack/react-query`
- Context API: Built-in React

### Routing
- React Router: `react-router-dom`
- Next.js Router: Built-in with Next.js
- Reach Router: Legacy, check for migration needs

### Styling Solutions
- Tailwind CSS: `tailwindcss`, `tailwind.config.js`
- Styled Components: `styled-components`
- Emotion: `@emotion/react`
- CSS Modules: `*.module.css` files
- Sass: `sass`, `node-sass`

## Common Project Structures

### Standard React Structure
```
src/
├── components/
│   ├── common/
│   └── ui/
├── pages/
├── hooks/
├── services/
├── utils/
├── types/
├── assets/
└── App.tsx
```

### Feature-Based Structure
```
src/
├── features/
│   ├── auth/
│   ├── dashboard/
│   └── profile/
├── shared/
│   ├── components/
│   ├── hooks/
│   └── utils/
└── App.tsx
```

## Build Commands Template

### Vite Projects
```bash
# Development
npm run dev
# or
yarn dev

# Production build
npm run build
yarn build

# Preview build
npm run preview
yarn preview

# Type checking
npx tsc --noEmit
```

### Create React App Projects
```bash
# Development
npm start
yarn start

# Production build
npm run build
yarn build

# Test
npm test
yarn test

# Eject (permanent)
npm run eject
```

### Custom Webpack Projects
```bash
# Development
npm run start
npm run dev

# Production build
npm run build

# Test
npm run test
```

## Testing Frameworks

### Jest + React Testing Library (Most Common)
```bash
# Run tests
npm test
yarn test

# Run tests with coverage
npm test -- --coverage
yarn test --coverage

# Run tests in CI mode
npm test -- --ci --coverage --passWithNoTests
```

### Vitest (Modern Alternative)
```bash
# Run tests
npm run test
vitest

# Run tests with UI
vitest --ui

# Run tests with coverage
vitest --coverage
```

## Code Quality Tools

### ESLint
```bash
# Run linter
npm run lint
npx eslint src/

# Fix linting issues
npm run lint:fix
npx eslint src/ --fix
```

### Prettier
```bash
# Format code
npm run format
npx prettier --write src/

# Check formatting
npx prettier --check src/
```

### TypeScript
```bash
# Type checking
npx tsc --noEmit

# Build with types
npx tsc

# Watch mode
npx tsc --watch
```

## Development Patterns to Look For

### Component Patterns
- Functional components with hooks
- Custom hooks for logic reuse
- Component composition over inheritance
- Props interface definitions (TypeScript)

### State Management Patterns
- useState for local state
- useReducer for complex state
- Context for global state
- External libraries (Redux, Zustand)

### Performance Patterns
- React.memo for component memoization
- useMemo for expensive calculations
- useCallback for function memoization
- Code splitting with React.lazy

### Error Handling Patterns
- Error boundaries for component errors
- Try-catch in async operations
- Error state in components
- Toast notifications for user feedback

## Environment Configuration

### Environment Variables
```bash
# Development
REACT_APP_API_URL=http://localhost:3000
REACT_APP_ENV=development

# Production
REACT_APP_API_URL=https://api.production.com
REACT_APP_ENV=production
```

### Configuration Files to Check
- `.env` files (`.env.local`, `.env.development`, `.env.production`)
- `public/manifest.json` (PWA configuration)
- `tsconfig.json` (TypeScript configuration)
- Package manager configs (`package-lock.json`, `yarn.lock`)

## Performance Optimization Guidelines

### Bundle Analysis
```bash
# Analyze bundle size (CRA)
npm run build
npx serve -s build

# Bundle analyzer
npm install --save-dev webpack-bundle-analyzer
npm run build -- --analyze
```

### Code Splitting Recommendations
- Route-based splitting with React Router
- Component-based splitting for large components
- Library splitting for vendor code

### Performance Monitoring
- React DevTools Profiler
- Web Vitals measurement
- Lighthouse audits

## Deployment Patterns

### Static Hosting (Common)
- Netlify, Vercel, GitHub Pages
- Build artifacts in `build/` or `dist/`
- SPA routing configuration needed

### CDN Distribution
- AWS CloudFront
- Cloudflare
- Azure CDN

### Container Deployment
```dockerfile
# Common Dockerfile pattern
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## Agent-Specific Optimizations

### Code Generation Preferences
- Use TypeScript interfaces over types when possible
- Prefer functional components over class components
- Use custom hooks for reusable logic
- Follow React naming conventions (PascalCase for components)

### File Organization
- Group related files in feature directories
- Separate concerns (components, hooks, utils, types)
- Use index files for clean imports
- Co-locate tests with components

### Common Pitfalls to Avoid
- Missing key props in lists
- Not cleaning up useEffect subscriptions
- Mutating state directly
- Missing dependency arrays in useEffect
- Not handling loading/error states

### Quality Gates
```bash
# Pre-commit checks
npm run lint
npm run type-check
npm test -- --passWithNoTests
npm run build
```

This template provides a comprehensive foundation for analyzing React SPA projects and generating accurate, project-specific AGENTS.md files.