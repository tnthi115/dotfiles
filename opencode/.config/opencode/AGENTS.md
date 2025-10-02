# Personal OpenCode Agent Configuration

## Code Style Preferences

- Use consistent spacing (2 spaces for indentation)
- Follow existing code style in files being modified
- Keep functions focused and small when possible
- Add descriptive variable names
- Maintain proper error handling
- **Do not leave trailing or leading whitespace in generated files or code, especially markdown.**
- Ensure all generated markdown follows [GitHub's style guide](https://docs.github.com/en/get-started/writing-on-github)
- Ensure no syntax errors are present in generated code; if possible, check LSP and linter diagnostics, and run formatters if available for the given language. Reference your neovim config at ~/.config/nvim and ~/.local/share/nvim/mason/bin for available binaries before the rest of your $PATH.
- **Automatically format and lint all files (not just markdown) before writing or committing. This includes agent files, code, configs, and documentation. Ensure correct indentation, whitespace, section headers, and code block usage, following best practices for each file type.**

## Workflow Preferences

- Explain your reasoning before suggesting solutions
- When debugging, trace through the code's execution path
- For complex tasks, outline your approach first
- Show alternatives for non-trivial decisions

## Git and Commit Practices

- **NEVER commit code or files without explicit user permission**
- Only commit when the user explicitly asks you to commit (e.g., using "@commit" agent or directly requesting a commit)
- Only ask for confirmation if you are attempting to commit when the user didn't explicitly request it
- When making changes to files, focus on implementation and testing, not committing
- The user controls when and how commits are made
- Exception: The @commit agent is specifically designed for commits and has explicit permission

## Planning and Documentation Requirements

- **When explicitly asked for a plan, always create a markdown document containing the detailed plan**
- Plan documents should be saved as `plan.md` or `[task-name]-plan.md` in the current working directory
- Plans should be human-readable and usable for review and iteration, but ultimately optimized for coding agent implementation
- Plans should include:
  - Clear objectives and scope
  - Step-by-step breakdown of tasks with specific implementation details
  - Dependencies and prerequisites
  - Success criteria
  - File paths, function names, and technical specifications where relevant
  - Code structure and architecture decisions
- **When using planning agents or tools, default behavior should be to create a plan document**

## Security Practices

- Never commit sensitive data or credentials
- Alert me about potential security issues in code
- Sanitize user inputs in web applications
- Use environment variables for configuration
