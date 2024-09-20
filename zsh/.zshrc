# vim:foldmethod=marker:foldlevel=0

#!/bin/zsh
# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setopt histignorealldups sharehistory appendhistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
# setopt histignorealldups

# Keep 1000 lines of history within the shell and save it to ~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history
HISTFILE=~/.zsh_history

# Set variables based on OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    case $(lsb_release -i | awk '{print $3}') in
        Ubuntu)
            CARGO_PATH="/usr/lib/cargo"
            ZSH_AUTOSUGGESTIONS_PATH=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
            ZSH_SYNTAX_HIGHLIGHTING_PATH=/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
            COPY_CMD="xclip"
            ;;
        Arch)
            CARGO_PATH="$HOME/.cargo"
            ZSH_AUTOSUGGESTIONS_PATH=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
            ZSH_SYNTAX_HIGHLIGHTING_PATH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
            COPY_CMD="xclip"
            ;;
        *)
            ;;
    esac
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CARGO_PATH="$HOME/.cargo"
    ZSH_AUTOSUGGESTIONS_PATH=$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_SYNTAX_HIGHLIGHTING_PATH=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    COPY_CMD="pbcopy"

    # Autoremove after every brew uninstall command.
    # export HOMEBREW_AUTOREMOVE=1

    # Homebrew zsh completion: https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
    if type brew &>/dev/null
    then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

        # autoload -Uz compinit
        # compinit
    fi
fi

# Use vi keybindings
bindkey -v
export KEYTIMEOUT=1

# Yank to the system clipboard in vi-mode
function vi-yank-xclip {
    zle vi-yank
    echo "$CUTBUFFER" | $COPY_CMD -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Exports {{{

if [ -f ~/.exports ]; then
  source ~/.exports
fi

# }}}

# Aliases {{{

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# }}}

# FZF {{{

source <(fzf --zsh)

# Use fd instead of fzf
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal.
# - See the source code (copletion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude git . "$1"
}

source ~/dotfiles/zsh/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then lsd --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Keybindings
# source /usr/share/doc/fzf/examples/completion.zsh
# [ -f ~/.fzf-key-bindings.zsh ] && source $HOME/.fzf-key-bindings.zsh

# }}}

# Builtin Completion {{{

# zsh-completions plugin
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  # autoload -Uz compinit
  # compinit
fi

# Use modern completion system
autoload -Uz compinit
# compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Stolen from Brodie Robertson
# https://github.com/BrodieRobertson/dotfiles/blob/master/.zshrc
# TODO: copy more from Luke Smith
# https://github.com/LukeSmithxyz/voidrice/blob/master/.config/zsh/.zshrc

# Enable colors and change prompt:
# autoload -U colors && colors

# autoload -U compinit && compinit -u
# zstyle ':completion:*' menu select
# # Auto complete with case insenstivity
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# }}}

# Fun stuff {{{

if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v neofetch &> /dev/null; then
        nf
    fi
else
    T=1
    number=$RANDOM
    let "number >>= 14"
    if [ "$number" -eq $T ]
    then
        if command -v neofetch &> /dev/null; then
            nf
            # nfi
        fi
    else
        if command -v colorscript &> /dev/null; then
            colorscript -r
        fi
    fi
fi

# }}}

# Zsh plugins {{{

# Zap
# https://github.com/zap-zsh/zap
# To install but keep current zshrc:
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -keep

# Source zap
# [ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# Globally setting the prefix for Zap to git clone using an SSH key.
# export ZAP_GIT_PREFIX="git@github.com:"

# Syntax highlighting settings
# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Keybindings
# bindkey '^ ' autosuggest-accept

# Source plugins
# How to install: https://github.com/zsh-users/zsh-autosuggestions
# Right arrow, END, or alt+l (vi cmd mode right) to accept suggestion.
[ -f "$ZSH_AUTOSUGGESTIONS_PATH" ] && source "$ZSH_AUTOSUGGESTIONS_PATH" 2>/dev/null
# plug "$ZSH_AUTOSUGGESTIONS_PATH"

# Should be last.
# How to install: sudo apt-get install zsh-syntax-highlighting
[ -f "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ] && source "$ZSH_SYNTAX_HIGHLIGHTING_PATH" 2>/dev/null
# plug "$ZSH_SYNTAX_HIGHLIGHTING_PATH"

# https://github.com/tom-doerr/zsh_codex
# plug "tom-doerr/zsh_codex"

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# }}}

# Gcloud and Kubectl {{{

# The next line updates PATH for the Google Cloud SDK. (This appends to the front unfortunately.)
if [ -f '/Users/t.thi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/t.thi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/t.thi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/t.thi/google-cloud-sdk/completion.zsh.inc'; fi

# Zsh completion for kubectl
if command -v kubectl &> /dev/null; then source <(kubectl completion zsh); fi

# }}}

# glab - GitLab CLI tool {{{

# source <(glab completion -s  zsh)

# }}}

# zoxide {{{

# Make cd act like pushd and push the current dir onto the stack.
setopt AUTO_PUSHD

eval "$(zoxide init --cmd cd zsh)"

# }}}
