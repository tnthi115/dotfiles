# AGENTS.md

## Repository Purpose

This repository is a personal collection of configuration files ("dotfiles") for various software and tools (e.g., editors, shells, terminal emulators, window managers, etc.). Each subdirectory or file configures a different tool. There is no single build or runtime; treat each config in the context of its respective software.

## Dotfile Management Best Practices

- **Use a dotfile manager**: Tools like [GNU Stow](https://www.gnu.org/software/stow/), [chezmoi](https://www.chezmoi.io/), [yadm](https://yadm.io/), or [dotbot](https://github.com/anishathalye/dotbot) are recommended for managing symlinks and deploying configs across systems.
- **Follow the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)**: Place config files in standard locations (e.g., `~/.config/`) when possible.
- **Separate machine-specific and shared configs**: Use `.local` files, branches, or host-specific includes to keep personal and shared settings distinct.
- **Prefer symlinks over copying**: Symlinking ensures updates are reflected everywhere and avoids duplication.
- **Version control**: Track your dotfiles with git for easy backup, sharing, and rollback.
- **Document installation/bootstrap steps**: Provide clear instructions (in README or here) for setting up your dotfiles on a new machine.
- **Never commit secrets or credentials**: Always keep sensitive data out of version control.
- **(Optional) Use CI to test dotfiles**: Consider using continuous integration to check for syntax errors or broken configs.

## Build, Lint, and Test Commands

- **Run all Python tests:**  
  `pytest`
- **Run a single test file:**  
  `pytest path/to/test_file.py`
- **Run a single test class or method:**  
  `pytest path/to/test_file.py::TestClass::test_method`
- **Lint Python code:**  
  `ruff .` and `pylint <module>`
- **Type check:**  
  `mypy .`
- **Formatting:**  
  Use 2 spaces for indentation (see .editorconfig).

## Code Style Guidelines

- **General Principle:**  
  - Follow FOSS (Free and Open Source Software) best practices for code and config style.  
  - Reference the official documentation of each respective tool or software when editing or creating configs.  
  - When in doubt, follow examples from popular dotfile/config repos on GitHub for that tool.
- **Imports (for code):**  
  - Use absolute imports where possible.  
  - Group: stdlib, third-party, local.
- **Formatting:**  
  - Max line length: 88 (ruff, pylint).  
  - End files with a newline.  
  - Use LF line endings.
- **Naming:**  
  - Variables/functions: `snake_case`  
  - Classes: `PascalCase`  
  - Constants: `UPPER_CASE`
- **Types:**  
  - Use type annotations (see mypy strict mode).
- **Error Handling:**  
  - Prefer specific exceptions.  
  - Test error cases (see test_calculator.py).
- **General:**  
  - No trailing/leading whitespace.  
  - Follow [GitHub Markdown style](https://docs.github.com/en/get-started/writing-on-github).  
  - Never commit secrets.
test change
test change 2
test change 3
