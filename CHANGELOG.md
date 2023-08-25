## Unreleased

### Feat

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
