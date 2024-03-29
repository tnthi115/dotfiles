## Unreleased

### Feat

- **yazi**: add yazi.toml
- **aliases**: add sv alias for sudo -e to us my nvim config with sudo
- **wezterm**: update fonts after update
- **golangci-lint**: add golden config
- **exports**: update gitlab token env to hide token from repo
- **exports**: change editor and manpager to nvim; add nvim mason to path instead of lvim mason
- **yabai**: ignore Docker Desktop
- **tmux**: add tmux integration for navigator.nvim plugin
- add image.nvim to LazyVim config and integrate with tmux
- **aliases**: update vim/nvim aliases and add gb alias to fzf pick git branch
- **jetbrains**: add .ideavimrc after experimenting with goland
- **aliases**: add vs function to switch between neovim configs
- **lvim**: add local indent setting for go files (commented)
- **gitconfig**: change git editor from lvim to nvim
- **nvim**: add lazyvim config as submodule
- **lvim**: add function and keybind for running telescope live_grep with glob patterns
- **lvim**: add gitlab.vim ai code suggestions plugin
- **brewfile**: install goland
- **aliases**: add az_login function
- add gitlab integration to lvim and lazygit
- **lvim**: add mdformat markdown formatter
- **brew**: add Brewfile and alias for brew bundle dump
- **aliases**: add importing matrix certs into Keychain Access on cmdline
- **lvim**: update ogpt.nvim models too mistral:7b-instruct to conform to f5 ai approvals
- **yabai**: add sia to list of unmanaged apps
- **helix**: disable golint in golangci-lint
- **lvim**: update gopls hints and disable golint in golanci-lint
- **doomemacs**: fix font weight and title bar, add some package config
- **lvim**: disable f, F, t, T, ; and , motions for flash.nvim
- **doomemacs**: minor changes nothing works yet
- **lvim**: format all lazy.nvim keys to one line each; add flash.nvim
- **lvim**: remove C-s keybind to save
- **lvim**: remove java lang support and c-a keybind to stop cmp
- **doomemacs**: add WIP doom emacs config
- **helix**: add WIP helix config
- **lvim**: update ogpt.nvim plugin config after new changes
- **lvim**: change BufferKill keybind to <leader>bk from <leader>bc
- **exports**: remove ogpt.nvim env vars
- **aliases**: add re alias to source exports
- **zsh**: move exports to .exports file
- **lvim**: remove conceallevel=1
- **aliases**: add helpful echo messages in matrix_all_certs and add mac alias
- **lvim**: add gen.nvim and ogpt.nvim (+ trouble.nvim and nui.nvim)
- **aliases**: add function for logging into google cloud for volterra (f5xc)
- **zsh**: add OPENAI_API_HOST and _KEY env vars for nvim ogpt plugin
- **tmux**: change prefix to ctrl + space from ctrl + e
- **lvim**: enable golint, revive, ifshort, and maybe other linters for golangci-lint
- **skhd**: change Google Chrome to Firefox
- **aliases**: add matrix_all_certs() shell function
- **lvim**: add "gopkg.volterra.us" as a company prefix for goimports-revisor
- **raycast**: add script to launch firefox in hardened profile and bind it to cmd + P
- **raycast**: open firefox in private mode in "hardened" profile
- **lvim**: setlocal conceallevel=2 for markdown files, add toggle conceallevel keybind for markdown
- **lvim**: update list of golangci-lint linters, setup gopher dap
- add toml lsp
- install and configure helix (deez nuts)
- unalias hx and uninstall miniconda
- update firefox
- **lvim**: add flags for goimports-reviser; auto install lsps; enable gofumpt, goimports, and varnamelen linters for golangci-lint
- **tmux**: remove time in bottom right status
- **gitconfig**: change global email to t.thi@f5.com for work and add ssh instead of https
- **zsh**: add GOPATH and GOPRIVATE for volterra
- **aliases**: add $HOME/f5-bin to PATH so that matrix cli can be in my path
- **lvim**: use shfmt instead of beautysh, use 2 spaces instead of 4 for sh
- **aliases**: change swenv to use a new find command that lists all directories that contain pyvenv.cfg in the current project and $HOME/venvs
- **lvim**: add pylint for python linting and add pyupgrade to ruff linters; add pyproject.toml
- **macos**: comment out keybinds and remove simlink to DefaultKeyBinding.dict
- **lvim**: change todo-comment highlighting to highlight only bg
- **tmux**: add keybind to swap tmux session with popup window
- **lvim**: add inlay hints settings to gopls in preparation for neovim inlay hints in 0.10
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

- **aliases**: remove work aliases
- **aliases**: az_login function
- **lvim**: automatic_servers_installation setting in lvim
- **tmux**: status bar transparency
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

- **lazygit**: change order of flags in glab mr create custom command
- **lvim**: remove javascript and ruby as ft for gitlab.vim plugin lazy config
- **aliases**: remove nvim alias to lvim
- **aliases**: move importing of matrix certs out of matrix_all_certs() function and into its own function import_matrix_certs()
- **lvim**: clean up cpp language configuration, but not using cpp
- **aliases**: improve swenv() function to use an array of paths and check for fd
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
