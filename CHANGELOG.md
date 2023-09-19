## Unreleased

### Feat

- **aliases**: add current directory .venv to swenv shell function
- **lvim**: add treesitter-textobjects to lvim
- **lvim**: add more python ruff linters
- change fzf alt-c keybind to use pushd instead of cd
- update neogen config with better comments and golang section
- **lvim**: change todo-comments to highlight todos outside of comments as well
- **lvim**: add keybind for new cellular automaton scramble animation
- **lvim**: add neogen plugin for docstring/annotation generation for multiple languages
- **lvim**: add minimal sql support
- **lvim**: add docstring linter to ruff
- **lvim**: add --python-executable flag to mypy command to use the current python interpreter for when in a virtual environment
- **zsh**: install zap plugin manager, but currently not using
- **lvim**: add airflow linting in ruff
- add python virtual environment support
- **gitconfig**: add alias for `git diff --stat arg1..arg2`
- **lvim**: add ruff-lsp to replace ruff as a plain linter
- **lvim**: configure golangci-lint-ls and gopls
- **lvim**: add auto update of mason tools
- **lvim**: add wip sql support
- **macos**: add macos/KeyBindings dir to stow DefaultKeyBindings.dict on macos
- **lvim**: add bandit security linting to ruff
- **lvim**: add treesitter ensure installed to lsp/languages/cpp.lua
- **lvim**: add single_file_support = true to pyright lsp settings
- **lvim**: add more lsp settings to pyright and yamlls and add commented out pyright settings in ftplugin/python.lua
- **raycast**: add raycast config
- **lvim**: add WIP toggle_bufferline() and add working toggle number and relativenumber
- **zsh**: add zsh completion for brew
- **lvim**: add JavaSE-1.8 runtime and original swenv.nvim plugin
- **lvim**: add autocommand to call `:MasonToolsInstall` on `LspAttach` event
- **lvim**: add mason-tool-installer to ensure mason packages are installed with code
- **lvim**: add binding for setting runtime with select function (java still partially broken)
- **lvim**: install java with sdkman and enable java language features in lvim
- **zsh**: add java openjdk@11 to path
- **tmux**: add transparent background instead of using $thm_black
- **lvim**: add WIP java language settings
- **lvim**: add extra rules for ruff, auto imports for pyright, and format .tmp.py
- **lvim**: add usort for python formatting
- **lvim**: add --strict flag to mypy
- **lvim**: update golang language support
- **lvim**: add cmp-nvim-lsp-signature-help to replace lsp_signature.nvim
- **aliases**: add new alias for tree, rm, cp, mv, mkdir
- **lvim**: add telescope-file-browser
- **lvim**: add yamlls settings
- **lvim**: add full python language support
- **lvim**: add global commitlint config and commitlint linter in lvim
- change lazygit commitizen custom keybind to "Z" from "C"
- add commitizen config file
- change telescope theme to default center from dropdown lvim default
- add conventional commits (commented) in lvim and commitizen custom command in lazygit

### Fix

- **lvim**: remove deprecated linters in golanci-lint
- **tmux**: transparency of status bar
- **lvim**: move golangci-lint-ls and gopls setup back to lsp/languages/go.lua for now so it starts up correctly
- move macos/KeyBindings to Keybindings so stow will work
- **lvim**: lazy load nvim-jdtls on LspAttach event instead of ft = java
- **lvim**: fix deprecation warnings for fidget and dressing
- **lvim**: add iferr to golang mason ensure installed
- **lvim**: java language support
- **lvim**: remove deprecated anchor setting for dressing.nvim
- **lvim**: add back markdown linter and formatter universally in lsp/init.lua
- **zsh**: remove hardcoded go path export
- **lvim**: remove golines and install golangci-lint through mason
- **lvim**: typo in file browser whichkey description
- **commitlint**: rename commitlint.config.js to .commitlintrc.js
- **aliases**: add quotes around the dir path argument to pushd
- cmp-conventionalcommits plugin to correctly lazy load with configuration

### Refactor

- **lvim**: change neogen generate() keybind to nn from ng
- **zsh**: comment out extra compinit
- **lvim**: change language keybindings to be local to the attached buffer instead of global
- **lvim**: move all language keybinds to Code -> lang -> keys to allow multiple lang keybinds at the same time
- **lvim**: add python to description of python debugging keybinds
- **lvim**: move pyright settings to lsp server configuration in ftplugin/python.lua and remove lspsettings/pyright.json
- **aliases**: add command check for ranger alias
- **lvim**: move nvim-gdb plugin to lsp/languages/cpp.lua
- **lvim**: move lsp, formatter, linter setup to ftplugin/ instead of lsp/languages for golang, java, and python
- **lvim**: uncomment after/ftplugin/java.lua and add early return
- **lvim**: rename gitcommit.lua to conventionalcommits.lua and add gitcommit to codespell filetypes
- **lvim**: clean up python and markdown language settings
- **yabai**: add better window resizing keybinds in skhd
- **lvim**: remove telescope-file-browser plugin
- **lvim**: remove comments in config.lua
- **lvim**: clean up some plugin configuration
- **lvim**: add neotest as a dependency of neotest-python
