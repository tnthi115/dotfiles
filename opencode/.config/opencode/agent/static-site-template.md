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
    "hugo *": "allow"
    "jekyll *": "allow"
    "gatsby *": "allow"
    "next *": "allow"
    "nuxt *": "allow"
    "vite *": "allow"
    "astro *": "allow"
    "eleventy *": "allow"
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

# Static Site Project Template

This template provides a foundation for analyzing Static Site Generator projects and generating optimized AGENTS.md files specific to JAMstack and static site projects.

## Project Detection Criteria

A project is classified as Static Site if it has:
- Static site generator configuration files
- Typical static site structure (`content/`, `static/`, `public/`)
- Common static site dependencies and build tools

```bash
# Detection command
test -f package.json -o -f config.toml -o -f _config.yml -o -f gatsby-config.js -o -f next.config.js -o -f nuxt.config.js -o -f vuepress.config.js && (rg -q "static|build.*site|generate" . || find . -name "*.md" -path "./content/*" | head -1)
```

## Technology Stack Analysis

### Static Site Generators

#### JavaScript/Node.js Based
- **Gatsby**: `gatsby`, `gatsby-config.js`, GraphQL layer
- **Next.js**: `next`, `next.config.js`, static export mode
- **Nuxt.js**: `nuxt`, `nuxt.config.js`, generate mode
- **VuePress**: `vuepress`, `.vuepress/config.js`
- **Docusaurus**: `@docusaurus/core`, `docusaurus.config.js`
- **Gridsome**: `gridsome`, `gridsome.config.js`
- **11ty**: `@11ty/eleventy`, `.eleventy.js`

#### Go Based
- **Hugo**: `config.toml`, `config.yaml`, `hugo.toml`

#### Ruby Based
- **Jekyll**: `_config.yml`, `Gemfile`, `_site/`

#### Python Based
- **MkDocs**: `mkdocs.yml`, Material theme
- **Sphinx**: `conf.py`, reStructuredText
- **Pelican**: `pelicanconf.py`, `publishconf.py`

#### Rust Based
- **Zola**: `config.toml`, templates/

### Content Management
- **Markdown**: `.md`, `.mdx` files with frontmatter
- **CMS**: Contentful, Strapi, Sanity, Forestry, Netlify CMS
- **Git-based CMS**: Direct file editing in repository
- **Headless CMS**: API-driven content management

### Styling Solutions
- **CSS Frameworks**: Tailwind CSS, Bootstrap, Bulma
- **CSS-in-JS**: Styled Components, Emotion (for React-based)
- **Preprocessors**: Sass, Less, Stylus
- **PostCSS**: Autoprefixer, purge CSS

### Hosting & Deployment
- **CDN/Static Hosting**: Netlify, Vercel, GitHub Pages
- **Cloud Storage**: AWS S3, Google Cloud Storage, Azure
- **Traditional Hosting**: Apache, Nginx static serving

## Common Project Structures

### Hugo Structure
```
site/
├── archetypes/
├── content/
├── data/
├── layouts/
├── static/
├── themes/
├── config.toml
└── public/
```

### Gatsby Structure
```
gatsby-site/
├── src/
│   ├── components/
│   ├── pages/
│   ├── templates/
│   └── images/
├── content/
├── static/
├── gatsby-config.js
├── gatsby-node.js
└── public/
```

### Jekyll Structure
```
jekyll-site/
├── _posts/
├── _pages/
├── _layouts/
├── _includes/
├── _sass/
├── assets/
├── _config.yml
└── _site/
```

### Next.js Static Structure
```
next-static/
├── pages/
├── components/
├── public/
├── styles/
├── content/
├── next.config.js
└── out/
```

### 11ty Structure
```
eleventy-site/
├── src/
│   ├── _includes/
│   ├── posts/
│   └── pages/
├── _data/
├── .eleventy.js
└── _site/
```

## Build Commands Template

### Hugo Projects
```bash
# Development server
hugo server -D --bind=0.0.0.0

# Production build
hugo --minify

# Build with specific environment
hugo --environment production

# Generate with future/draft content
hugo -D -F
```

### Gatsby Projects
```bash
# Development server
npm run develop
gatsby develop

# Production build
npm run build
gatsby build

# Serve built site locally
npm run serve
gatsby serve

# Clean cache and build
gatsby clean && gatsby build
```

### Jekyll Projects
```bash
# Development server
bundle exec jekyll serve
bundle exec jekyll serve --drafts

# Production build
JEKYLL_ENV=production bundle exec jekyll build

# Build with future posts
bundle exec jekyll build --future

# Incremental build
bundle exec jekyll serve --incremental
```

### Next.js Static
```bash
# Development server
npm run dev
next dev

# Static export
npm run build
npm run export

# Combined build and export
npm run build && npm run export
```

### 11ty Projects
```bash
# Development server
npx @11ty/eleventy --serve

# Production build
npx @11ty/eleventy

# Watch mode
npx @11ty/eleventy --watch

# Debug mode
DEBUG=* npx @11ty/eleventy
```

### MkDocs Projects
```bash
# Development server
mkdocs serve

# Production build
mkdocs build

# Deploy to GitHub Pages
mkdocs gh-deploy

# Build with verbose output
mkdocs build --verbose
```

## Content Management Commands

### Markdown Processing
```bash
# Create new post/page (Hugo)
hugo new posts/my-new-post.md
hugo new content posts/my-new-post.md

# Create new post (Jekyll)
bundle exec jekyll post "My New Post"

# Validate markdown syntax
markdownlint content/**/*.md

# Convert markdown to HTML
pandoc input.md -o output.html
```

### Content Validation
```bash
# Check for broken links
htmlproofer ./_site --check-html --check-external-hash

# Validate frontmatter
python scripts/validate_frontmatter.py

# Spell check content
aspell check content/posts/*.md

# Check markdown formatting
prettier --check content/**/*.md
```

## Asset Optimization Commands

### Image Optimization
```bash
# Optimize images (Hugo)
hugo --minify --gc

# Image processing (Gatsby)
gatsby-plugin-image

# Manual image optimization
imagemin src/images/**/* --out-dir=static/images/

# WebP conversion
cwebp input.jpg -o output.webp
```

### Performance Optimization
```bash
# Bundle analysis (Gatsby)
npm run build -- --open-analyzer

# Lighthouse audit
lighthouse https://your-site.com

# Bundle size analysis
npm run analyze
```

## Development Patterns to Look For

### Content Patterns
- Frontmatter schema and conventions
- Taxonomy systems (tags, categories)
- Content organization and navigation
- Multilingual content support

### Template Patterns
- Layout inheritance and composition
- Partial template usage
- Data binding and context
- Custom shortcodes or components

### Build Patterns
- Asset pipeline optimization
- Content processing workflows
- Plugin/theme architecture
- Environment-specific builds

### SEO Patterns
- Meta tag generation
- Sitemap generation
- RSS feed creation
- Structured data implementation

## Deployment Commands

### Netlify Deployment
```bash
# Deploy to Netlify
netlify deploy --prod

# Deploy specific directory
netlify deploy --dir=public --prod

# Deploy with build command
netlify deploy --build --prod
```

### Vercel Deployment
```bash
# Deploy to Vercel
vercel --prod

# Deploy static files
vercel --prod ./public
```

### GitHub Pages
```bash
# Deploy to GitHub Pages (Jekyll)
git push origin main

# Deploy using Actions
# (handled by .github/workflows/deploy.yml)

# Manual gh-pages deploy
npm run deploy
```

### AWS S3 + CloudFront
```bash
# Sync to S3
aws s3 sync ./public s3://your-bucket --delete

# Invalidate CloudFront
aws cloudfront create-invalidation --distribution-id ABCD --paths "/*"
```

## Testing Commands

### Content Testing
```bash
# Test build process
npm run build && echo "Build successful"

# Test links and HTML
htmlproofer ./_site --check-html --check-external-hash

# Performance testing
lighthouse-ci https://your-site.com

# Cross-browser testing
# Using Playwright or similar
```

### Visual Testing
```bash
# Screenshot testing
percy exec -- npm run build

# Visual regression testing
backstop test
```

## Code Quality Tools

### Linting & Formatting
```bash
# Markdown linting
markdownlint content/**/*.md

# Prose linting
alex content/**/*.md

# Format markdown
prettier --write content/**/*.md

# HTML validation
html5validator --root _site/
```

### Content Quality
```bash
# Spell checking
cspell "content/**/*.md"

# Grammar checking
textlint content/**/*.md

# Accessibility testing
pa11y-ci --sitemap https://your-site.com/sitemap.xml
```

## Environment Configuration

### Static Site Environment Variables
```bash
# Build environment
NODE_ENV=production
HUGO_ENV=production
JEKYLL_ENV=production

# CMS Configuration
CONTENTFUL_SPACE_ID=your-space-id
CONTENTFUL_ACCESS_TOKEN=your-token
STRAPI_API_URL=https://your-strapi.com

# Analytics
GOOGLE_ANALYTICS_ID=GA-XXXXX-X
GOOGLE_TAG_MANAGER_ID=GTM-XXXXX

# Comments/Forms
DISQUS_SHORTNAME=your-shortname
NETLIFY_FORM_NAME=contact

# Deployment
NETLIFY_SITE_ID=your-site-id
VERCEL_TOKEN=your-token
```

### Configuration Files to Check
- Generator configs (`config.toml`, `_config.yml`, `gatsby-config.js`)
- Package files (`package.json`, `Gemfile`, `requirements.txt`)
- Deployment configs (`.netlify/`, `vercel.json`, `.github/workflows/`)
- Content schemas (`archetypes/`, `_drafts/`, `content/`)

## Performance Optimization Guidelines

### Build Performance
- Incremental builds for development
- Parallel processing where available
- Asset optimization pipelines
- CDN configuration for static assets

### Runtime Performance
- Image optimization and lazy loading
- CSS and JavaScript minification
- Critical CSS inlining
- Service worker for caching

### SEO Optimization
- Meta tag optimization
- Structured data implementation
- Sitemap generation
- RSS feed optimization
- Social media integration

## Content Management Best Practices

### Content Organization
- Consistent frontmatter schemas
- Logical content hierarchy
- URL structure optimization
- Content archiving strategies

### Workflow Patterns
- Git-based content workflows
- Editorial review processes
- Automated content validation
- Staging/preview environments

## Agent-Specific Optimizations

### Code Generation Preferences
- Follow generator-specific conventions
- Use appropriate templating syntax
- Implement proper content schemas
- Follow SEO best practices

### File Organization
- Separate content from presentation
- Use consistent naming conventions
- Organize assets logically
- Maintain clean URL structures

### Common Pitfalls to Avoid
- Missing alt text for images
- Broken internal links
- Slow build times due to inefficient queries
- Missing meta tags for SEO
- Poor mobile responsiveness
- Inadequate performance optimization

### Quality Gates
```bash
# Pre-deployment checks
npm run build  # or hugo, jekyll build, etc.
npm run test:links
npm run test:html
npm run lighthouse:ci

# Content validation
markdownlint content/
alex content/
htmlproofer ./_site/
```

### Content Guidelines
- Write accessible content
- Use semantic HTML structure
- Implement proper heading hierarchy
- Include descriptive alt text
- Optimize for loading performance
- Follow content style guides

## Monitoring & Analytics

### Performance Monitoring
```bash
# Core Web Vitals monitoring
web-vitals-cli https://your-site.com

# Lighthouse CI
lhci autorun

# Bundle analysis
npm run analyze
```

### Content Analytics
- Google Analytics integration
- Search Console monitoring
- Social media tracking
- User engagement metrics

This template provides comprehensive guidance for analyzing static site projects and generating accurate, project-specific AGENTS.md files for JAMstack and static site generators.