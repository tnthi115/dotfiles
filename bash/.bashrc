# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# vim aliases
alias vim="lvim"
alias nvim="lvim"
alias oldnvim="\nvim"
alias oldvim="\vim"
alias vimf="vim \$(fzf)"

# personal aliases
alias nfi="neofetch --wpm --backend kitty --source /media/sf_Downloads/wallpapers/gruvbox/new-project-5.png"
# alias rw="nitrogen --set-scaled --random /media/sf_Downloads/wallpapers/gruvbox"
alias rw="nitrogen --set-zoom-fill --random /media/sf_Downloads/wallpapers/gruvbox"
alias tn="notify-send -i ~/.config/awesome/awesome-wm-widgets/battery-widget/spaceman.jpg -t 10000 'test' 'hello this is a test notification!'"
alias obsidian="/opt/obsidian/Obsidian-0.15.9.AppImage"
alias cs164-sshfs="sudo sshfs -o allow_other cs164-aak@cedar.cs.berkeley.edu:/home/cc/cs164/fa22/class/cs164-aak/ ~/Classes/cs164/cs164-aak -o IdentityFile=/home/user/.ssh/id_ed25519 && pushd ~/Classes/cs164/cs164-aak"
alias lg="lazygit"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # eval "$__conda_setup"
# else
    # if [ -f "/home/user/anaconda3/etc/profile.d/conda.sh" ]; then
        # . "/home/user/anaconda3/etc/profile.d/conda.sh"
    # else
        # export PATH="/home/user/anaconda3/bin:$PATH"
    # fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# export REPO_DIR=/home/user/Classes/cs61b/fa20-s211
# export SNAPS_DIR=/home/user/snaps-fa20-s211
# export REPO_DIR=/home/user/Classes/ai_cs61b/sp21-s1659
# export REPO_DIR=/home/user/Classes/ai_cs61bl/su21-s470

# set -o vi

# fortune | cowsay -f $(ls /usr/share/cowsay/cows|shuf -n 1) | lolcat
# conda deactivate

# if [ $TERM = xterm-kitty ]; then
#     neofetch --wpm --source /media/sf_Downloads/Background\ Photos/sushi.jpg
# else
#     neofetch
# fi

# Add cargo to path
export PATH="$PATH:/home/user/.cargo/bin"

# Add lvim to path
export PATH="$PATH:/home/user/.local/bin/"

# Set editor.
export EDITOR="lvim"

# Setting for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Enable fzf keybindings for Bash
source /usr/share/doc/fzf/examples/key-bindings.bash

# Enable fuzzy auto-completion for Bash
# source /usr/share/doc/fzf/examples/completion.bash

set -o vi
# colorscript random

# # Show git branch in bash prompt.
# DEFAULT=$PS1
# parse_git_branch() {
#   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ( \1)/'
# }
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[33m\]\[\$(parse_git_branch)\[\033[00m\]\] \$ "
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\] \$ "

# alias tmux
alias tmux='tmux -2'

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

eval "$(starship init bash)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
