#
# abbrs - like aliases
#
# NOTE: Refactored from add_abbr_if_not_exists to plain abbr -a for performance.
# Since I use 'exec fish' or start new shells (not re-sourcing config files),
# plain abbr -a is sufficient. Each shell starts with a clean abbreviation state.
#
# Trade-off: ~60-120ms faster shell startup, but will show "already exists" errors
# if this file is manually sourced multiple times in the same session.
#
# Use add_abbr_if_not_exists (available in functions/) only when re-sourcing
# abbreviation files within the same shell session.
#

abbr -a -- - 'cd -'
abbr -a -- tarls 'tar -tvf'
abbr -a -- untar 'tar -xv'
abbr -a -- zz exit

# single key
abbr -a -- c clear
abbr -a -- h history
abbr -a -- l 'ls -UF'

# better ls
abbr -a -- la 'ls -lah'
abbr -a -- ldot 'ls -ld .*'
abbr -a -- ll 'ls -lGFh'
abbr -a -- lsa 'ls -aGF'
abbr -a -- tree 'lsd --tree --all --ignore-glob "\.git"'

# quick nav
abbr -a -- fconf 'cd $__fish_config_dir'
abbr -a -- fishconf 'cd $__fish_config_dir'
abbr -a -- fdot 'cd $__fish_config_dir'
abbr -a -- zdot 'cd $ZDOTDIR'

# date/time
abbr -a -- ds 'date +%Y-%m-%d'
abbr -a -- ts 'date +%Y-%m-%dT%H:%M:%SZ'
abbr -a -- yyyymmdd 'date +%Y%m%d'

# nvim
abbr -a -- v nvim
abbr -a -- nv nvim
abbr -a -- sv 'sudo -e'

# git
abbr -a -- gs 'git status'
abbr -a -- gl 'git log'
abbr -a -- gb 'git checkout (git branch | fzf | sed "s/^\\* //; s/ //g")'
abbr -a -- ga 'git add -A'
abbr -a -- gc 'git commit'
abbr -a -- gP 'git push'
abbr -a -- gPf 'git push --force'
abbr -a -- gp 'git pull'

abbr -a -- gad 'git add'
abbr -a -- gbn 'git rev-parse --abbrev-ref HEAD'
abbr -a -- gcl 'git clean'
abbr -a -- gcmt 'git commit -am '
abbr -a -- gco 'git checkout'
abbr -a -- gcob 'git checkout -b '
abbr -a -- gcod 'git checkout develop'
abbr -a -- gcom 'git checkout master'
abbr -a -- get git
abbr -a -- glg 'git log'
abbr -a -- glog git\ log\ --Uraph\ --pretty=\'\%Cred\%h\%Creset\ -\%C\(auto\)\%d\%Creset\ \%s\ \%Cgreen\(\%ad\)\ \%C\(bold\ blue\)\<\%an\>\%Creset\'\ --date=short
abbr -a -- gpll 'git pull'
abbr -a -- gpristine 'git reset --hard && git clean -fdx'
abbr -a -- gpsh 'git push'
abbr -a -- gpsuo 'git push --set-Upstream origin (git rev-parse --abbrev-ref HEAD)'
abbr -a -- grm 'git rm'
abbr -a -- grv 'git remote -v'
abbr -a -- gsh 'git stash'
abbr -a -- gst 'git status -sb'
# abbr -a -- gclone 'git clone git@github.com:mattmc3/'
abbr -a -- gwhoami 'echo "user.name:" (git config user.name) && echo "user.email:" (git config user.email)'

# cli
abbr -a -- lg lazygit
abbr -a -- ld lazydocker
abbr -a -- k kubectl
abbr -a -- y yazi

# unix
abbr -a -- mv 'mv -i'
abbr -a -- cp 'cp -i'
abbr -a -- mkdir 'mkdir -p'

# brew
abbr -a -- bdump 'brew bundle dump --file=~/dotfiles/Brewfile --force'
abbr -a -- bup 'brew update && brew upgrade && brew cleanup'
abbr -a -- bo 'brew outdated'
abbr -a -- bi 'brew install'
abbr -a -- bU 'brew uninstall'
abbr -a -- bu 'brew upgrade'
abbr -a -- bs 'brew search'
abbr -a -- bl 'brew deps --formula --for-each $(brew leaves) | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
abbr -a -- bd 'brew deps --include-build --tree $(brew leaves)'

abbr -a -- oc opencode

# function abbreviations
abbr -a -- sg source_goenv
# abbr -a -- rf reload_fish
abbr -a -- rf 'exec fish'
