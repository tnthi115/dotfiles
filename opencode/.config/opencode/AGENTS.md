# Personal OpenCode Agent Configuration

## Always Ask For Confirmation

When modifying code:

1. First show the proposed changes
2. Ask for explicit confirmation before executing any code changes
3. Only proceed with file modifications after receiving clear approval

## Code Style Preferences

- Use consistent spacing (2 spaces for indentation)
- Follow existing code style in files being modified
- Keep functions focused and small when possible
- Add descriptive variable names
- Maintain proper error handling
- **Do not leave trailing or leading whitespace in generated files or code, especially markdown.**
- Ensure all generated markdown follows [GitHub's style guide](https://docs.github.com/en/get-started/writing-on-github)
- Ensure no syntax errors are present in generated code; if possible, check LSP and linter diagnostics, and run formatters if available for the given language. Reference your neovim config at ~/.config/nvim and /Users/t.thi/.local/share/nvim/mason/bin for available binaries before the rest of your $PATH.

## Workflow Preferences

- Explain your reasoning before suggesting solutions
- When debugging, trace through the code's execution path
- For complex tasks, outline your approach first
- Show alternatives for non-trivial decisions

## Security Practices

- Never commit sensitive data or credentials
- Alert me about potential security issues in code
- Sanitize user inputs in web applications
- Use environment variables for configuration
