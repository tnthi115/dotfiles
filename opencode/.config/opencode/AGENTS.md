# Personal OpenCode Agent Configuration

## Code Style Preferences

- Use consistent spacing (2 spaces for indentation)
- Follow existing code style in files being modified
- Keep functions focused and small when possible
- Add descriptive variable names
- Maintain proper error handling
- **Do not leave trailing or leading whitespace in generated files or code, especially markdown.**
- Ensure all generated markdown follows [GitHub's style guide](https://docs.github.com/en/get-started/writing-on-github)
- Ensure no syntax errors are present in generated code; if possible, check LSP and linter diagnostics, and run formatters if available for the given language. Reference your neovim config at ~/.config/nvim and /Users/t.thi/.local/share/nvim/mason/bin for available binaries before the rest of your $PATH.
- **Automatically format and lint all files (not just markdown) before writing or committing. This includes agent files, code, configs, and documentation. Ensure correct indentation, whitespace, section headers, and code block usage, following best practices for each file type.**

## Workflow Preferences

- Explain your reasoning before suggesting solutions
- When debugging, trace through the code's execution path
- For complex tasks, outline your approach first
- Show alternatives for non-trivial decisions

## Planning and Documentation Requirements

- **When explicitly asked for a plan, always create a markdown document containing the detailed plan**
- Plan documents should be saved as `plan.md` or `[task-name]-plan.md` in the current working directory
- Plans should include:
  - Clear objectives and scope
  - Step-by-step breakdown of tasks
  - Dependencies and prerequisites
  - Timeline estimates where applicable
  - Success criteria
- **When using planning agents or tools, default behavior should be to create a plan document**

## Security Practices

- Never commit sensitive data or credentials
- Alert me about potential security issues in code
- Sanitize user inputs in web applications
- Use environment variables for configuration
