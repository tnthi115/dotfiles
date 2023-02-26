# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

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

# Aliases {{{

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias b="pushd +\$(dirs -v | fzf | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]].*//')"
alias v='vim'
alias vimf="vim \$(fzf)"
alias vf="vim \$(fzf)"

# }}}

# Setting for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# zsh-autocomplete {{{
# 
# # The code below sets all of Autocomplete's settings to their default values. To
# # change a setting, copy it into your `.zshrc` file and modify it there.
# 
# 
# zstyle ':autocomplete:*' default-context ''
# # '': Start each new command line with normal autocompletion.
# # history-incremental-search-backward: Start in live history search mode.
# 
# zstyle ':autocomplete:*' min-delay 0.05  # seconds (float)
# # Wait this many seconds for typing to stop, before showing completions.
# 
# zstyle ':autocomplete:*' min-input 1  # characters (int)
# # Wait until this many characters have been typed, before showing completions.
# 
# zstyle ':autocomplete:*' ignored-input '' # extended glob pattern
# # '':     Always show completions.
# # '..##': Don't show completions for the current word, if it consists of two
# #         or more dots.
# 
# zstyle ':autocomplete:*' list-lines 16  # int
# # If there are fewer than this many lines below the prompt, move the prompt up
# # to make room for showing this many lines of completions (approximately).
# 
# zstyle ':autocomplete:history-search:*' list-lines 16  # int
# # Show this many history lines when pressing ↑.
# 
# zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16  # int
# # Show this many history lines when pressing ⌃R or ⌃S.
# 
# zstyle ':autocomplete:*' insert-unambiguous no
# # no:  Tab inserts the top completion.
# # yes: Tab first inserts a substring common to all listed completions, if any.
# 
# zstyle ':autocomplete:*' fzf-completion no
# # no:  Tab uses Zsh's completion system only.
# # yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# # ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# # have installed Fzf's shell extensions.
# 
# # Add a space after these completions:
# zstyle ':autocomplete:*' add-space \
#     executables aliases functions builtins reserved-words commands
# 
# 
# ##
# # Config in this section should come BEFORE sourcing Autocomplete and cannot be
# # changed at runtime.
# #
# 
# # Autocomplete automatically selects a backend for its recent dirs completions.
# # So, normally you won't need to change this.
# # However, you can set it if you find that the wrong backend is being used.
# zstyle ':autocomplete:recent-dirs' backend cdr
# # cdr:  Use Zsh's `cdr` function to show recent directories as completions.
# # no:   Don't show recent directories.
# # zsh-z|zoxide|z.lua|z.sh|autojump|fasd: Use this instead (if installed).
# # ⚠️ NOTE: This setting can NOT be changed at runtime.
# 
# zstyle ':autocomplete:*' widget-style complete-word
# # complete-word: (Shift-)Tab inserts the top (bottom) completion.
# # menu-complete: Press again to cycle to next (previous) completion.
# # menu-select:   Same as `menu-complete`, but updates selection in menu.
# # ⚠️ NOTE: This setting can NOT be changed at runtime.
# 
# 
# # source zsh-autocomplete
# source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# skip_global_compinit=1
# 
# 
# ##
# # Config in this section should come AFTER sourcing Autocomplete.
# #
# 
# # Up arrow:
# bindkey '\e[A' up-line-or-search
# bindkey '\eOA' up-line-or-search
# # up-line-or-search:  Open history menu.
# # up-line-or-history: Cycle to previous history line.
# 
# # Down arrow:
# bindkey '\e[B' down-line-or-select
# bindkey '\eOB' down-line-or-select
# # down-line-or-select:  Open completion menu.
# # down-line-or-history: Cycle to next history line.
# 
# # Control-Space:
# bindkey '\0' list-expand
# # list-expand:      Reveal hidden completions.
# # set-mark-command: Activate text selection.
# 
# # Uncomment the following lines to disable live history search:
# # zle -A {.,}history-incremental-search-forward
# # zle -A {.,}history-incremental-search-backward
# 
# # Return key in completion menu & history menu:
# bindkey -M menuselect '\r' .accept-line
# # .accept-line: Accept command line.
# # accept-line:  Accept selection and exit menu.

# }}}

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
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
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

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

# Fun stuff
T=1
number=$RANDOM
# let "number %= $BINARY"
let "number >>= 14"
if [ "$number" -eq $T ]
then
  neofetch
else
  colorscript -r
fi

# Syntax highlighting settings
# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Source plugins
# How to install: https://github.com/zsh-users/zsh-autosuggestions
# Right arrow, END, or alt+l (vi cmd mode right) to accept suggestion.
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# Should be last.
# How to instal: sudo apt-get install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
source <(/usr/local/bin/starship init zsh --print-full-init)
# eval "$(starship init bash)"
