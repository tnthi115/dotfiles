# AGENTS.md

## Repository Purpose

This repository is a comprehensive personal dotfiles collection managing configurations for 40+ development tools across macOS and Linux environments. It provides a complete development ecosystem including multiple text editors (Neovim LazyVim, VS Code, Helix), terminal emulators (Kitty, WezTerm, Ghostty), shells (Zsh, Fish with Starship), window managers (Yabai, Aerospace, AwesomeWM), and development tooling. Configuration management uses GNU Stow for safe symlink deployment with XDG Base Directory compliance and consistent theming (TokyoNight/Gruvbox Material) across all tools.

**AI-First Development Environment:** This repository is optimized for AI agent collaboration with native OpenCode integration, specialized agent templates for different project types, and AI-assisted Git workflows through Lazygit OpenCode integration.

## Technology Stack

### Configuration Management Strategy

- **Deployment**: GNU Stow for conflict-safe symlink management
- **Organization**: Directory-per-tool with XDG Base Directory compliance
- **Theme System**: Consistent TokyoNight and Gruvbox Material themes across all tools
- **Version Control**: Git with conventional commits and Delta diff enhancement
- **Package Management**: Homebrew (macOS) + Brewfile, pacman (Arch Linux) + pkglist
- **AI Integration**: Native OpenCode agent templates and automated commit message generation

### Development Environment

- **Primary Editor**: Neovim with LazyVim configuration and comprehensive LSP setup
- **Terminal Multiplexer**: Tmux with custom status bar and session management
- **Shell Environment**: Zsh with Oh My Zsh, Fish with modern alternatives
- **Git Workflow**: Lazygit TUI with OpenCode integration, Delta diff viewer, conventional commit standards
- **File Management**: Yazi file manager, FZF fuzzy finder, LSD enhanced listing
- **AI Development**: OpenCode integration for commit message generation and agent-assisted workflows

### Python Development (Strict Quality Gates)

- **Runtime**: Python 3.7+ compatibility with strict type checking
- **Linting**: Ruff (60+ rule categories) + Pylint with custom strict configuration
- **Type Checking**: MyPy in strict mode with comprehensive rules
- **Testing**: Pytest with coverage reporting
- **Formatting**: Ruff formatter (88 character line limit)
- **Commit Standards**: Commitizen for conventional commit enforcement

## AI Integration & Agent Optimization

### OpenCode Integration (Native AI Development Environment)

This repository features comprehensive OpenCode integration for AI-assisted development workflows:

**Lazygit + OpenCode Commit Message Generation:**

- **Location**: `~/dotfiles/lazygit/bin/reword-commit-with-opencode.sh`
- **Function**: Automatically rewrites commit messages using OpenCode AI with context-aware prompts
- **Usage**: Integrated into Lazygit TUI for seamless commit message improvement
- **Model**: GitHub Copilot GPT-4.1 with specialized commit message formatting
- **Features**: Preserves commit footers, handles stashing, supports both amend and rebase workflows

**Serena MCP Server (Primary Code Intelligence):**

- **Location**: `~/dotfiles/serena/.serena/serena_config.yml`
- **Purpose**: Advanced code analysis and manipulation via Model Context Protocol
- **Key Capabilities**:
  - Symbol-level code understanding (`serena_find_symbol`, `serena_find_referencing_symbols`)
  - Intelligent code editing (`serena_replace_symbol_body`, `serena_insert_after_symbol`)
  - Pattern-based search (`serena_search_for_pattern`)
  - File operations with context (`serena_read_file`, `serena_create_text_file`)
  - Memory management for complex tasks (`serena_write_memory`, `serena_read_memory`)
  - Shell command execution (`serena_execute_shell_command`)

**Active OpenCode Agent Templates:**

- **Location**: `~/.config/opencode/agent/`
- **Templates Available**:
  - `commit.md` - Conventional commit message generation
  - `docs-writer.md` - Documentation generation and maintenance
  - `review.md` - Code review assistance

**AI Workflow Commands:**

```bash
# Generate improved commit messages via Lazygit
lazygit  # Use 'c' to commit, then 'r' to reword with OpenCode

# Direct OpenCode usage for commit messages
opencode run --mode build --model github-copilot/gpt-4.1 "Rewrite this commit message: [message]"

# Agent-assisted tasks
opencode agent commit "Generate conventional commit message"
opencode agent docs-writer "Update project documentation"
opencode agent review "Review this code for quality"
```

### Raycast System Automation

**Automation Scripts** (`~/dotfiles/bin/raycast/`):

- `launch-yabai-and-skhd.sh` - Window manager service management
- `launch-hardened-firefox.sh` - Privacy-focused Firefox launcher
- `open-firefox-private-window.sh` - Quick private browsing
- `run-shell-command.sh` - General command execution
- `f5xc-control-plane-team-goals-status.sh` - Team status monitoring

**Integration Benefits:**

- Quick system state changes via spotlight-like interface
- Automated window manager restart workflows
- Privacy-focused application launching
- System monitoring and status checking

## Development Environment Setup

### Prerequisites & System Requirements

- **Git** and **GNU Stow** (essential for deployment)
- **Package Manager**: Homebrew (macOS) or pacman (Arch Linux)
- **Nerd Font**: CaskaydiaCove, Hack, or JetBrains Mono recommended for icon support
- **Terminal**: Any modern terminal with true color support
- **Platform**: macOS (primary) or Linux (tested on Arch)

### Installation Workflow

```bash
# 1. Clone repository to standard location
git clone --recurse-submodules https://github.com/tnthi115/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Install system packages
# macOS:
brew bundle --file=Brewfile
# Arch Linux:
sudo pacman -S --needed - < pkglist.txt

# 3. Backup existing configurations (CRITICAL - prevent data loss)
mkdir -p ~/.config-backup
cp -r ~/.config ~/.config-backup/ 2>/dev/null || true
cp ~/.zshrc ~/.config-backup/.zshrc.backup 2>/dev/null || true
cp ~/.tmux.conf ~/.config-backup/.tmux.conf.backup 2>/dev/null || true

# 4. Validate stow deployment (dry run - detect conflicts)
stow -n */  # Shows what would be linked without making changes

# 5. Deploy configurations incrementally (recommended approach)
stow git          # Git configuration with Delta integration
stow zsh          # Shell environment with Oh My Zsh
stow tmux         # Terminal multiplexer configuration
stow nvim         # Neovim with LazyVim setup
stow starship     # Cross-shell prompt
stow lazygit      # Git TUI configuration

# 6. Deploy terminal emulator (choose one initially)
stow kitty        # OR wezterm OR ghostty

# 7. Deploy window manager (macOS specific)
stow yabai skhd   # Tiling window manager + hotkeys
# OR stow aerospace # Alternative tiling manager

# 8. Verify deployment
stow --restow */  # Re-link all configurations
```

### Post-Installation Verification

```bash
# Validate shell configuration
zsh -n ~/.zshrc && echo "Zsh config valid"

# Test tmux configuration
tmux source-file ~/.tmux.conf && echo "Tmux config loaded"

# Verify Git configuration
git config --list | head -10

# Check Neovim health (after first launch)
nvim +checkhealth +qall

# Validate Starship prompt
starship config ~/.config/starship.toml && echo "Starship config valid"
```

### Development Session Startup

```bash
# Start comprehensive development session
tmux new-session -d -s main -c ~/projects

# Launch file manager with preview
yazi

# Open Git UI for current project
lazygit

# System monitoring
btop  # Modern system monitor

# Quick project navigation
sesh connect <session-name>  # Session manager integration
```

## Build, Test & Quality Commands

### Python Development (Comprehensive Quality Gates)

```bash
# Run all tests with coverage
pytest --cov=. --cov-report=term-missing
pytest --cov=. --cov-report=html  # Generate HTML coverage report

# Run specific tests
pytest test_calculator.py                    # Single file
pytest test_calculator.py::TestCalculator    # Specific class
pytest test_calculator.py::TestCalculator::test_add  # Specific method

# Comprehensive linting (60+ rule categories enabled)
ruff check .                    # Check all issues
ruff check --fix .             # Auto-fix fixable issues
ruff check --watch .           # Watch mode for development

# Legacy linting with pylint (strict configuration)
pylint calculator.py           # Lint specific file
pylint --fail-under=10 .      # Enforce minimum score

# Type checking (strict mode enabled)
mypy .                         # Check all Python files
mypy --install-types .         # Install missing type stubs

# Code formatting (follows Black style with 88 char limit)
ruff format .                  # Format all Python files
ruff format --check .          # Check formatting without changes
```

### Configuration Validation & Testing

```bash
# GNU Stow validation
stow -n */                     # Dry run - show what would be linked
stow --adopt */               # Adopt existing files (use carefully)
stow --restow */              # Re-link all configurations

# Shell configuration testing
zsh -n ~/.zshrc               # Syntax check Zsh config
fish -n ~/.config/fish/config.fish  # Syntax check Fish config
bash -n ~/.bashrc             # Syntax check Bash config

# Tmux configuration validation
tmux source-file ~/.tmux.conf # Reload configuration
tmux list-sessions            # Verify sessions work

# Git configuration verification
git config --list --show-origin  # Show all config sources
git config --global --list       # Show global settings only

# Neovim health checks
nvim +checkhealth +qall       # Run all health checks
nvim +LazyHealth +qall        # Check LazyVim plugin health

# Terminal emulator config testing
kitty --config ~/.config/kitty/kitty.conf --debug-gl  # Kitty GL debug
```

### Package Management & Dependencies

```bash
# Homebrew (macOS) management
brew bundle --file=Brewfile              # Install all dependencies
brew bundle dump --file=Brewfile --force # Update Brewfile
brew bundle cleanup --file=Brewfile      # Remove unlisted packages
brew doctor                               # Check system health

# Package list maintenance (Arch Linux)
pacman -Qqe > pkglist.txt                # Update package list
comm -23 <(pacman -Qqe | sort) <(sort pkglist.txt)  # Show extra packages

# Git submodule management
git submodule update --init --recursive  # Initialize submodules
git submodule update --remote           # Update to latest commits
git submodule foreach 'git pull origin main'  # Update all submodules
```

### Performance & System Monitoring

```bash
# System monitoring
btop                          # Modern system monitor
htop                          # Alternative system monitor
fastfetch                     # System information display

# Disk usage and cleanup
du -sh ~/.config/*           # Config directory sizes
du -sh ~/dotfiles/*          # Dotfile directory sizes

# Network and connectivity
ping -c 4 8.8.8.8            # Basic connectivity
curl -w "@curl-format.txt" -s -o /dev/null https://google.com  # Response timing
```

## Code Style & Architecture Guidelines

### Dotfiles Repository Organization

```
~/dotfiles/
├── tool-name/                    # Each tool gets dedicated directory
│   ├── .config/
│   │   └── tool-name/           # XDG Base Directory structure
│   │       ├── config-file      # Main configuration
│   │       ├── themes/          # Theme-specific configs
│   │       └── plugins/         # Extensions/plugins
│   ├── additional-files         # Tool-specific extras
│   └── README.md               # Tool documentation (optional)
├── .stow-local-ignore          # Files excluded from stow deployment
├── Brewfile                    # macOS package dependencies
├── pkglist.txt                 # Arch Linux package list
└── AGENTS.md                   # This file
```

### GNU Stow Integration Patterns

- **Symlink Strategy**: Stow creates symlinks from `~/dotfiles/tool-name/` to target locations
- **Conflict Handling**: Always run `stow -n` (dry run) before deployment
- **Ignore Patterns**: `.stow-local-ignore` excludes documentation, cache, and build artifacts
- **Selective Deployment**: Deploy tools incrementally rather than all at once (`stow */`)
- **Backup Strategy**: Always backup existing configs before first deployment

### Configuration File Standards

**XDG Base Directory Compliance:**

- Config files: `~/.config/tool-name/`
- Data files: `~/.local/share/tool-name/`
- Cache files: `~/.cache/tool-name/`
- Runtime files: `~/.local/state/tool-name/`

**Theme Consistency:**

- Primary themes: TokyoNight (dark/light variants) and Gruvbox Material
- Color schemes synchronized across all tools
- Font consistency: Nerd Fonts with ligature support
- Icon themes: Consistent iconography where supported

### Python Code Standards (from pyproject.toml)

**Naming Conventions:**

```python
# Variables and functions: snake_case
user_name = "example"
def calculate_total(): pass

# Classes: PascalCase
class UserManager: pass

# Constants: UPPER_CASE
MAX_RETRIES = 3
DEFAULT_TIMEOUT = 30

# Private attributes: leading underscore
class Example:
    def __init__(self):
        self._private_attr = "hidden"
```

**Code Quality Rules:**

- Line length: 88 characters (Black/Ruff standard)
- Python compatibility: 3.7+ required
- Import organization: stdlib → third-party → local
- Type hints: Required for all functions (mypy strict mode)
- Docstrings: Required for functions longer than 12 lines
- Error handling: Prefer specific exceptions over generic Exception

### Git Workflow Standards

**Conventional Commits (enforced by commitlint):**

```bash
# Format: <type>[optional scope]: <description>
feat: add support for Ghostty terminal configuration
fix(nvim): resolve LazyVim plugin loading issue
docs: update installation instructions for macOS
style(zsh): improve prompt configuration readability
refactor: reorganize tmux session management
test: add validation for stow deployment scripts
```

**Branch Naming:**

```bash
feature/add-helix-configuration
bugfix/fix-kitty-font-rendering
hotfix/urgent-security-update
refactor/improve-theme-system
```

### Tool-Specific Configuration Patterns

**Neovim (LazyVim-based):**

- Plugin management via LazyVim package manager
- LSP configurations for Python, Go, TypeScript, Lua, Rust
- Custom keymaps in `~/.config/nvim/lua/config/keymaps.lua`
- Theme integration with automatic switching

**Tmux Configuration:**

- Session management with automatic restoration
- Status bar with Git integration and system monitoring
- Vi-mode key bindings for navigation
- Plugin management via TPM (Tmux Plugin Manager)

**Shell Configuration (Zsh/Fish):**

- Modular configuration with separate files for aliases, exports, functions
- Lazy loading for performance optimization
- Cross-shell compatibility where possible
- Integration with Starship prompt for consistency

## Comprehensive Tool Inventory

### Text Editors & IDEs

**Neovim (Primary Editor)**

- **Config Location**: `~/.config/nvim/`
- **Framework**: LazyVim with LSP, Treesitter, and 100+ plugins
- **Languages**: Python, Go, TypeScript, Lua, Rust, Markdown support
- **Features**: Auto-completion, debugging, Git integration, file tree
- **Theme Integration**: TokyoNight and Gruvbox Material themes

**VS Code**

- **Config Location**: `~/Library/Application Support/Code/User/`
- **Extensions**: GitLens, Docker, Kubernetes, Go, Python, Copilot
- **Settings**: Theme consistency with other editors
- **Integration**: Terminal and Git workflow alignment

**Helix**

- **Config Location**: `~/.config/helix/`
- **Features**: Kakoune-inspired editing, built-in LSP support
- **Keybindings**: Vi-like with modern enhancements
- **Languages**: Multi-language support with tree-sitter

### Terminal Emulators

**Kitty (GPU-Accelerated)**

- **Config Location**: `~/.config/kitty/`
- **Features**: GPU acceleration, ligature support, multiple windows/tabs
- **Performance**: Hardware acceleration for smooth scrolling
- **Customization**: Theme integration, font configuration

**WezTerm (Rust-Based)**

- **Config Location**: `~/.config/wezterm/`
- **Configuration**: Lua-based configuration system
- **Features**: Built-in multiplexer, extensive customization
- **Platform**: Cross-platform with consistent behavior

**Ghostty (Modern)**

- **Config Location**: `~/.config/ghostty/`
- **Features**: Modern terminal by Mitchell Hashimoto
- **Performance**: Optimized for speed and resource usage

### Shell & Command Line Environment

**Zsh (Primary Shell)**

- **Config Location**: `~/.zshrc`, `~/.config/zsh/`
- **Framework**: Oh My Zsh with custom plugins
- **Features**: Auto-completion, syntax highlighting, Git integration
- **Plugins**: fzf, zsh-autosuggestions, zsh-syntax-highlighting

**Fish (Alternative Shell)**

- **Config Location**: `~/.config/fish/`
- **Features**: Smart autocompletion, syntax highlighting out-of-box
- **Philosophy**: User-friendly defaults with minimal configuration

**Starship (Universal Prompt)**

- **Config Location**: `~/.config/starship.toml`
- **Features**: Cross-shell prompt, Git status, language version display
- **Performance**: Fast prompt rendering with async updates

### Window Management (macOS Focus)

**Yabai (Tiling Window Manager)**

- **Config Location**: `~/.config/yabai/yabairc`
- **Features**: Binary space partitioning, automatic tiling
- **Integration**: SKHD for hotkey management
- **SIP Requirements**: System Integrity Protection modifications needed

**SKHD (Hotkey Daemon)**

- **Config Location**: `~/.config/skhd/skhdrc`
- **Purpose**: Keyboard shortcuts for Yabai and system control
- **Features**: Application launching, window manipulation

**Aerospace (Alternative Tiling)**

- **Config Location**: `~/.config/aerospace/aerospace.toml`
- **Features**: Tiling window manager alternative to Yabai
- **SIP**: No System Integrity Protection modifications required

**AwesomeWM (Linux)**

- **Config Location**: `~/.config/awesome/`
- **Language**: Lua configuration
- **Features**: Highly customizable window manager for Linux

### Development Tools & Utilities

**Tmux (Terminal Multiplexer)**

- **Config Location**: `~/.tmux.conf`
- **Features**: Session persistence, window/pane management
- **Plugins**: TPM (Tmux Plugin Manager), status bar customization
- **Integration**: Git status, system monitoring in status bar

**Lazygit (Git TUI)**

- **Config Location**: `~/.config/lazygit/`
- **Features**: Intuitive Git interface, Delta diff integration
- **Performance**: Fast repository navigation and staging

**Git Configuration**

- **Config Location**: `~/.gitconfig`
- **Features**: Delta diff viewer, conventional commit setup
- **Integration**: GPG signing, multiple identity management

**Docker & Kubernetes**

- **Tools**: Docker Desktop, kubectl, k9s
- **Integration**: VS Code extensions for container development
- **Configuration**: Context switching and namespace management

### File Management & Navigation

**Yazi (File Manager)**

- **Config Location**: `~/.config/yazi/`
- **Features**: File preview, image thumbnails, archive browsing
- **Performance**: Fast directory navigation with vi-like keybindings

**FZF (Fuzzy Finder)**

- **Integration**: Shell history, file finding, Git integration
- **Features**: Multi-select, preview window, custom key bindings
- **Performance**: Fast searching across large datasets

**LSD (Enhanced ls)**

- **Features**: File type icons, color coding, tree view
- **Integration**: Alias replacement for standard `ls` command

**Zoxide (Smart cd)**

- **Features**: Frecency-based directory jumping
- **Integration**: Shell aliases for quick navigation

### Monitoring & System Tools

**btop (System Monitor)**

- **Features**: Resource monitoring with modern TUI
- **Performance**: Real-time CPU, memory, disk, network monitoring

**Fastfetch (System Info)**

- **Features**: Fast system information display
- **Configuration**: Custom logo and information layout

## Agent Optimization Guidelines

### AI-Enhanced Development Workflows

**Serena MCP Integration Patterns:**

```bash
# Code analysis and symbol navigation
serena_find_symbol "function_name"  # Find symbol definitions
serena_find_referencing_symbols "ClassName" "file.py"  # Find all references
serena_get_symbols_overview "src/main.py"  # Get file structure overview

# Intelligent code editing
serena_replace_symbol_body "function_name" "file.py" "new_implementation"
serena_insert_after_symbol "ClassName" "file.py" "new_method"
serena_rename_symbol "old_name" "file.py" "new_name"

# Pattern-based search and file operations
serena_search_for_pattern "regex_pattern"  # Search codebase
serena_read_file "path/to/file"  # Read with context
serena_replace_content "file.py" "old_pattern" "new_content" "regex"

# Memory management for complex tasks
serena_write_memory "task_name" "progress and context"
serena_read_memory "task_name"  # Restore context after compaction
```

**OpenCode Agent Workflow Integration:**

```bash
# AI-assisted commit message generation (integrated with Lazygit)
# 1. Stage changes in Lazygit
# 2. Press 'c' to commit, then 'r' to reword with OpenCode
# 3. AI analyzes diff and generates conventional commit message
# Result: Contextual, properly formatted commit messages

# Development phase assistance
opencode agent commit "Generate conventional commit message for staged changes"
opencode agent docs-writer "Update documentation based on code changes"
opencode agent review "Review this code for quality and best practices"
```

### Pre-Commit Quality Gates (Run Automatically)

```bash
# Comprehensive quality check pipeline
ruff check --fix .              # Auto-fix Python linting issues
ruff format .                   # Format Python code to standards
mypy .                          # Type check all Python files
pytest --tb=short              # Run tests with concise output
git diff --check               # Check for whitespace errors
stow -n */                     # Verify stow deployment works

# Additional validation for configuration changes
zsh -n ~/.zshrc                # Validate shell syntax
tmux source-file ~/.tmux.conf  # Test tmux configuration
git config --list >/dev/null   # Verify git config is valid
```

### Development Workflow Integration Patterns

**Session Management with Tmux:**

```bash
# Standard development session setup
tmux new-session -d -s main -c ~/projects
tmux split-window -h           # Horizontal split for terminal/editor
tmux split-window -v           # Vertical split for monitoring
tmux select-pane -t 0          # Focus main pane

# Project-specific session templates
tmux source-file ~/.config/tmux/session-templates/python-dev.conf
```

**Git Workflow Integration:**

```bash
# Enhanced Git workflow with delta and lazygit
git log --oneline --graph --decorate  # Visual branch history
git diff --name-status         # File change summary
lazygit                        # Full-featured Git TUI

# Conventional commit workflow
cz commit                      # Interactive conventional commit
cz changelog                   # Generate changelog from commits
```

**File Navigation & Search:**

```bash
# FZF integration patterns
fzf --preview 'bat --color=always {}'  # File preview with syntax highlighting
fd -t f | fzf --preview 'head -20 {}'  # Find files with content preview
git log --oneline | fzf --preview 'git show {+1}'  # Interactive Git log

# Yazi file management
yazi ~/projects               # Navigate project directories
yazi --select-path ~/.config  # Start with specific directory selected
```

### Configuration Management Best Practices

**Safe Deployment Procedures:**

1. **Always Backup First**: `cp -r ~/.config ~/.config-backup-$(date +%Y%m%d)`
2. **Test in Isolation**: `stow -n tool-name` before actual deployment
3. **Deploy Incrementally**: Single tools rather than bulk deployment (`stow */`)
4. **Validate After Changes**: Source configs and test functionality
5. **Version Control**: Commit and push changes before system-wide deployment

**Theme and Visual Consistency:**

- Maintain TokyoNight/Gruvbox Material themes across all tools
- Use consistent Nerd Fonts (CaskaydiaCove/Hack/JetBrains Mono)
- Synchronize color schemes between terminal, editor, and shell
- Test theme changes across all configured applications

**Performance Optimization Patterns:**

- Enable lazy loading in shell configurations for faster startup
- Use GPU acceleration in terminal emulators where available
- Configure appropriate caching for package managers and tools
- Monitor resource usage with btop/htop during development

### Common AI Agent Patterns & Tasks

**AI-Enhanced Configuration File Analysis:**

```bash
# When analyzing configuration files, check these locations first:
~/.config/tool-name/           # XDG-compliant configuration
~/.tool-name                   # Traditional home directory configs
~/dotfiles/tool-name/          # This repository's version

# Validate syntax:
tool-name --config-test ~/.config/tool-name/config
tool-name --validate-config ~/.config/tool-name/config
```

**AI-Powered Development Environment Setup:**

```bash
# Check dependencies:
brew list | grep tool-name              # Check if already installed (macOS)
pacman -Qi tool-name                    # Check package info (Arch Linux)
```

**AI-Driven Git Workflow & Commit Enhancement:**

```bash
# Lazygit + OpenCode integration workflow:
# 1. Open lazygit in repository
# 2. Stage files normally
# 3. Commit with 'c', then reword with 'r' for AI enhancement
# 4. OpenCode analyzes diff and generates contextual commit message

# Manual AI commit message generation:
opencode agent commit "Generate conventional commit for current staged changes"
opencode run --mode build --model github-copilot/gpt-4.1 \
  "Rewrite this commit message following conventional commits: [message]"
```

**AI-Enhanced Troubleshooting & Diagnostics:**

```bash
# Standard diagnostic commands:
stow --restow tool-name                 # Fix symlink issues
tmux source-file ~/.tmux.conf           # Reload tmux after changes
source ~/.zshrc                         # Reload shell configuration
nvim +checkhealth +qall                # Check Neovim plugin health

# Check standard log locations:
~/.local/share/nvim/                    # Neovim logs and data
~/.cache/                               # Application cache directories
/usr/local/var/log/                     # System logs (macOS)
```

**Available OpenCode Agents:**

```bash
# Active agents for common tasks:
opencode agent commit                  # Commit message generation
opencode agent docs-writer             # Documentation generation
opencode agent review                  # Code review assistance
```

### Security & Privacy Considerations

**Credential Management:**

- Never commit secrets, API keys, or passwords to version control
- Use environment variables or external credential managers
- Exclude sensitive files via `.stow-local-ignore` and `.gitignore`
- Review commits for accidentally included sensitive data

**Privacy-First Tool Configuration:**

- Firefox: Arkenfox user.js for hardened browsing
- DNS: Use privacy-respecting DNS servers (1.1.1.1, 9.9.9.9)
- Search: Configure privacy-focused search engines as defaults
- Analytics: Disable telemetry in development tools where possible

**Network Security:**

```bash
# SSH configuration review
ssh -T git@github.com           # Test Git SSH authentication
ssh-add -l                      # List loaded SSH keys
gpg --list-keys                 # Verify GPG key configuration

# Firewall and network validation
netstat -an | grep LISTEN       # Check listening ports
lsof -i                         # Show network connections
```

### Performance & Resource Monitoring

**System Health Checks:**

```bash
# Regular monitoring commands
btop                            # Interactive system monitor
df -h                           # Disk space usage
free -h                         # Memory usage (Linux)
top -o mem                      # Memory usage (macOS)

# Development environment health
nvim --startuptime startup.log  # Neovim startup performance
tmux info                       # Tmux session information
git gc --aggressive             # Git repository cleanup
```

**Optimization Opportunities:**

- Shell startup time: Profile `.zshrc` loading with `time zsh -i -c exit`
- Editor performance: Monitor Neovim plugin loading times
- Terminal rendering: Enable GPU acceleration where supported
- File operations: Use fast tools like `fd`, `rg`, `bat` instead of traditional alternatives

## Personal OpenCode Agent Configuration

### Code Style Preferences

- Use consistent spacing (2 spaces for indentation)
- Follow existing code style in files being modified
- Keep functions focused and small when possible
- Add descriptive variable names
- Maintain proper error handling
- **Do not leave trailing or leading whitespace in generated files or code, especially markdown**
- Ensure all generated markdown follows [GitHub's style guide](https://docs.github.com/en/get-started/writing-on-github)
- Ensure no syntax errors are present in generated code; check LSP and linter diagnostics when available
- **Automatically format and lint all files before writing or committing**

### Workflow Preferences

- Explain reasoning before suggesting solutions
- When debugging, trace through the code's execution path
- For complex tasks, outline approach first
- Show alternatives for non-trivial decisions

### Planning and Documentation Requirements

- **When explicitly asked for a plan, always create a markdown document containing the detailed plan**
- Plan documents should be saved as `plan.md` or `[task-name]-plan.md` in the current working directory
- Plans should include clear objectives, step-by-step breakdown, dependencies, timeline estimates, and success criteria
- **Default behavior when using planning agents should be to create a plan document**

### Security Practices

- Never commit sensitive data or credentials
- Alert about potential security issues in code
- Sanitize user inputs in web applications
- Use environment variables for configuration

### AI Agent Interaction Patterns

- Leverage OpenCode agent templates for specialized tasks
- Use Lazygit + OpenCode integration for commit message improvement
- Apply project-specific agents (golang-microservice, nodejs-api, python-ml, react-spa) based on context
- Run quality gates before commits using available linters and formatters
- Reference Neovim config at `~/.config/nvim` and Mason binaries at `~/.local/share/nvim/mason/bin` for tooling
