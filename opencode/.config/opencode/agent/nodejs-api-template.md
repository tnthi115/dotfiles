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

# Node.js API Project Template

This template provides a foundation for analyzing Node.js API projects and generating optimized AGENTS.md files specific to backend API services.

## Project Detection Criteria

A project is classified as Node.js API if it has:
- `package.json` with Node.js backend dependencies
- Typical API project structure (`src/`, `routes/`, `controllers/`)
- Common web frameworks (Express, Fastify, Koa, NestJS)

```bash
# Detection command
test -f package.json && (grep -q '"express"' package.json || grep -q '"fastify"' package.json || grep -q '"@nestjs/core"' package.json || grep -q '"koa"' package.json)
```

## Technology Stack Analysis

### Web Frameworks
- **Express.js**: `express`, `@types/express`
- **Fastify**: `fastify`, `@fastify/cors`
- **NestJS**: `@nestjs/core`, `@nestjs/common`
- **Koa**: `koa`, `@koa/router`
- **Hapi**: `@hapi/hapi`

### Database & ORM Libraries
- **Prisma**: `prisma`, `@prisma/client`
- **TypeORM**: `typeorm`, `reflect-metadata`
- **Sequelize**: `sequelize`, database drivers
- **Mongoose**: `mongoose` (MongoDB)
- **Drizzle**: `drizzle-orm`, `drizzle-kit`

### Authentication & Security
- **JWT**: `jsonwebtoken`, `@types/jsonwebtoken`
- **Passport**: `passport`, strategy packages
- **bcrypt**: `bcrypt`, `@types/bcrypt`
- **Helmet**: `helmet` (Express security)
- **CORS**: `cors`, `@types/cors`

### Validation & Documentation
- **Joi**: `joi`, `@types/joi`
- **Zod**: `zod`
- **class-validator**: `class-validator` (NestJS)
- **Swagger**: `swagger-ui-express`, `@nestjs/swagger`

### Testing Frameworks
- **Jest**: `jest`, `@types/jest`, `supertest`
- **Mocha**: `mocha`, `chai`, `sinon`
- **Vitest**: `vitest` (modern alternative)

## Common Project Structures

### Express.js Structure
```
src/
├── controllers/
├── middleware/
├── models/
├── routes/
├── services/
├── utils/
├── config/
├── types/
└── app.ts
```

### NestJS Structure
```
src/
├── modules/
│   ├── auth/
│   ├── users/
│   └── posts/
├── common/
│   ├── decorators/
│   ├── filters/
│   ├── guards/
│   └── interceptors/
├── config/
└── main.ts
```

### Clean Architecture Structure
```
src/
├── domain/
│   ├── entities/
│   └── repositories/
├── infrastructure/
│   ├── database/
│   └── external/
├── application/
│   ├── use-cases/
│   └── dto/
└── presentation/
    ├── controllers/
    └── middleware/
```

## Build Commands Template

### Standard Node.js Projects
```bash
# Development
npm run dev
npm start
yarn dev

# Production build (TypeScript)
npm run build
yarn build

# Start production
npm run start:prod
node dist/main.js

# Watch mode
npm run start:dev
npm run dev
```

### NestJS Projects
```bash
# Development
npm run start:dev

# Debug mode
npm run start:debug

# Production build
npm run build

# Start production
npm run start:prod

# Test
npm run test
npm run test:e2e
npm run test:cov
```

## Database Commands

### Prisma
```bash
# Generate client
npx prisma generate

# Run migrations
npx prisma migrate dev
npx prisma migrate deploy

# Database reset
npx prisma migrate reset

# Studio
npx prisma studio

# Database push (prototyping)
npx prisma db push
```

### TypeORM
```bash
# Run migrations
npm run typeorm migration:run

# Generate migration
npm run typeorm migration:generate -n MigrationName

# Revert migration
npm run typeorm migration:revert

# Create migration
npm run typeorm migration:create -n MigrationName
```

### Drizzle
```bash
# Generate migrations
npx drizzle-kit generate

# Push to database
npx drizzle-kit push

# Migration apply
npx drizzle-kit up

# Studio
npx drizzle-kit studio
```

## Testing Commands

### Jest
```bash
# Run all tests
npm test
yarn test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:cov
npm test -- --coverage

# Run specific test file
npm test -- user.test.ts

# Run e2e tests
npm run test:e2e
```

### Mocha
```bash
# Run tests
npm test
npx mocha

# Run with specific reporter
npx mocha --reporter spec

# Run with coverage (nyc)
npx nyc mocha
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

# Build
npx tsc

# Watch mode
npx tsc --watch
```

## Development Patterns to Look For

### API Patterns
- RESTful resource routing
- GraphQL schema definitions
- OpenAPI/Swagger documentation
- API versioning strategies

### Authentication Patterns
- JWT token authentication
- Session-based authentication
- OAuth integration
- Role-based access control (RBAC)

### Error Handling Patterns
- Global error middleware
- Custom error classes
- Structured error responses
- Error logging and monitoring

### Database Patterns
- Repository pattern
- Active Record pattern
- Data Transfer Objects (DTOs)
- Database connection pooling

### Validation Patterns
- Request validation middleware
- Schema validation (Joi, Zod)
- Input sanitization
- Type safety with TypeScript

## Environment Configuration

### Environment Variables
```bash
# Database
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
MONGODB_URI=mongodb://localhost:27017/dbname

# Authentication
JWT_SECRET=your-secret-key
JWT_EXPIRES_IN=7d

# Server
PORT=3000
NODE_ENV=development

# External APIs
REDIS_URL=redis://localhost:6379
SMTP_HOST=smtp.gmail.com
```

### Configuration Files to Check
- `.env` files (`.env.local`, `.env.development`, `.env.production`)
- `nodemon.json` (development configuration)
- `tsconfig.json` (TypeScript configuration)
- Database configuration files
- Docker configurations

## Performance Optimization Guidelines

### Caching Strategies
- Redis for session storage
- In-memory caching for frequent queries
- HTTP response caching
- Database query optimization

### Database Optimization
- Index optimization
- Query performance analysis
- Connection pooling configuration
- Read replicas for scaling

### Monitoring and Logging
- Winston or Pino for logging
- Health check endpoints
- Metrics collection (Prometheus)
- APM tools integration

## Security Best Practices

### Common Security Measures
- Input validation and sanitization
- SQL injection prevention
- XSS protection headers
- Rate limiting middleware
- HTTPS enforcement

### Authentication Security
- Password hashing (bcrypt)
- JWT token security
- Session management
- CSRF protection

## Deployment Patterns

### Container Deployment
```dockerfile
# Multi-stage Dockerfile
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Process Management
- PM2 for production
- Docker containers
- Kubernetes deployments
- Serverless functions

## API Documentation

### OpenAPI/Swagger
- Automatic API documentation
- Interactive API explorer
- Client SDK generation
- API testing interface

### GraphQL
- GraphQL Playground/Apollo Studio
- Schema introspection
- Query optimization
- Subscription support

## Agent-Specific Optimizations

### Code Generation Preferences
- Use TypeScript for type safety
- Follow REST API conventions
- Implement proper error handling
- Use dependency injection (NestJS)

### File Organization
- Separate concerns (controllers, services, models)
- Use modular architecture
- Follow framework conventions
- Group related functionality

### Common Pitfalls to Avoid
- Missing error handling middleware
- Unvalidated user input
- Missing authentication checks
- Poor database query performance
- Inadequate logging

### Quality Gates
```bash
# Pre-commit checks
npm run lint
npm run type-check
npm test
npm run build

# Database checks
npm run db:validate
npm run migration:check
```

### Testing Strategies
- Unit tests for business logic
- Integration tests for API endpoints
- End-to-end tests for user flows
- Database testing with test containers

This template provides comprehensive guidance for analyzing Node.js API projects and generating accurate, project-specific AGENTS.md files.