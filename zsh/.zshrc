# vim:foldmethod=marker:foldlevel=0

#!/bin/zsh
# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setopt histignorealldups sharehistory
setopt histignorealldups

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
    export HOMEBREW_AUTOREMOVE=1

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

# export XDG_CONFIG_HOME="$HOME/.config"

# Change cargo home directory
export CARGO_HOME="$CARGO_PATH"

# Add cargo to path
export PATH="$PATH:$CARGO_HOME/bin"

# Add lvim to path
export PATH="$PATH:$HOME/.local/bin"

# Set editor.
export EDITOR="lvim"

# Set manpager to be lvim.
export MANPAGER="lvim +Man!"

# Set pager to less.
export PAGER="less"

# Set 'time' output to look like bash's.
export TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'
# TIMEFMT=$'%J\n%U user\n%S system\n%P cpu\n%*E total'

# Add emacs/bin to path.
# export PATH="$PATH:$HOME/.config/emacs/bin"

# Add go to path
if command -v go &> /dev/null; then
    # export PATH="$PATH:/usr/local/go/bin"

    # Add go path to path
    # export GOPATH="/usr/lib/go"
    # export GOPATH="$HOME/go"
    # export GOPATH="$HOME/.local/lib/go"
    export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Add lvim mason to path
export PATH="$PATH:$HOME/.local/share/lvim/mason/bin"

# Add openjdk@11 to path
# export PATH="$PATH:/opt/homebrew/opt/openjdk@11/bin"

# SDKMAN
if command -v brew &> /dev/null; then
    export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
    [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi

# Add f5-bin to path
[[ -d $HOME/f5-bin ]] && export PATH="$PATH:$HOME/f5-bin"

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

# Setting for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Keybindings
# source /usr/share/doc/fzf/examples/completion.zsh
[ -f ~/.fzf-key-bindings.zsh ] && source $HOME/.fzf-key-bindings.zsh

# }}}

# Builtin Completion {{{

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate
