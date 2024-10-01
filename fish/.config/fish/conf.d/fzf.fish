#
# fzf
#

type -q fzf || return 1
fzf --fish | source

# Use fd instead of fzf
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --strip-cwd-prefix --follow --exclude .git'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --strip-cwd-prefix --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type=d --hidden --strip-cwd-prefix --exclude .git'

# # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# # - The first argument to the function ($1) is the base path to start traversal.
# # - See the source code (copletion.{bash,zsh}) for the details.
# function _fzf_compgen_path
#     fd --hidden --exclude .git . "$argv[1]"
# end
#
# # Use fd to generate the list for directory completion
# function _fzf_compgen_dir
#     fd --type=d --hidden --exclude git . "$argv[1]"
# end
#
# source ~/dotfiles/fish/fzf-git.fish
#
# # Preview options
# set -gx FZF_CTRL_T_OPTS '--preview "if [ -d {} ]; then lsd --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"'
# set -gx FZF_ALT_C_OPTS '--preview "lsd --tree --color=always {} | head -200"'
#
# # Advanced customization of fzf options via _fzf_comprun function
# # - The first argument to the function is the name of the command.
# # - You should make sure to pass the rest of the arguments to fzf.
# function _fzf_comprun
#     switch $argv[1]
#         case cd
#             echo "cd $argv[2..-1]" | fzf --preview "lsd --tree --color=always {} | head -200"
#         case "export|unset"
#             echo "eval 'echo ${}'" | fzf
#         case ssh
#             echo "dig $argv[2..-1]" | fzf
#         case *
#             echo "if [ -d {} ]; then lsd --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi" | fzf
#     end
# end

set -l base03 "#002b36"
set -l base02 "#292e42"
set -l base01 "#1a1b26"
set -l base00 "#16161e"
set -l base0 "#839496"
set -l base1 "#93a1a1"
set -l base2 "#c0caf5"
set -l base3 "#a9b1d6"
set -l yellow "#e0af68"
set -l orange "#ff9e64"
set -l red "#f7768e"
set -l magenta "#bb9af7"
set -l violet "#bb9af7"
set -l blue "#7aa2f7"
set -l cyan "#7dcfff"
set -l cyan1 "#27a1b9"
set -l green "#9ece6a"

# Comment and uncomment below for the light theme.

# Tokyonight Night color scheme for fzf
set -gx FZF_DEFAULT_OPTS "
    --color fg:-1,bg:-1,hl:$cyan1,fg+:$base2,bg+:$base02,hl+:$cyan1
    --color info:$green,prompt:$blue,pointer:$red,marker:$blue,spinner:$cyan1
    "
