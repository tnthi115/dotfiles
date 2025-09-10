#
# abbrs - like aliases
#

add_abbr_if_not_exists - 'cd -'
add_abbr_if_not_exists tarls 'tar -tvf'
add_abbr_if_not_exists untar 'tar -xv'
add_abbr_if_not_exists zz exit

# single key
add_abbr_if_not_exists c clear
add_abbr_if_not_exists h history
add_abbr_if_not_exists l 'ls -UF'

# better ls
add_abbr_if_not_exists la 'ls -lah'
add_abbr_if_not_exists ldot 'ls -ld .*'
add_abbr_if_not_exists ll 'ls -lGFh'
add_abbr_if_not_exists lsa 'ls -aGF'
add_abbr_if_not_exists tree 'lsd --tree --all --ignore-glob "\.git"'

# quick nav
add_abbr_if_not_exists fconf 'cd $__fish_config_dir'
add_abbr_if_not_exists fishconf 'cd $__fish_config_dir'
add_abbr_if_not_exists fdot 'cd $__fish_config_dir'
add_abbr_if_not_exists zdot 'cd $ZDOTDIR'

# date/time
add_abbr_if_not_exists ds 'date +%Y-%m-%d'
add_abbr_if_not_exists ts 'date +%Y-%m-%dT%H:%M:%SZ'
add_abbr_if_not_exists yyyymmdd 'date +%Y%m%d'

# nvim
add_abbr_if_not_exists v nvim
add_abbr_if_not_exists nv nvim
add_abbr_if_not_exists sv 'sudo -e'

# git
add_abbr_if_not_exists gs 'git status'
add_abbr_if_not_exists gl 'git log'
add_abbr_if_not_exists gb 'git checkout (git branch | fzf | sed "s/^\\* //; s/ //g")'
add_abbr_if_not_exists ga 'git add -A'
add_abbr_if_not_exists gc 'git commit'
add_abbr_if_not_exists gP 'git push'
add_abbr_if_not_exists gPf 'git push --force'
add_abbr_if_not_exists gp 'git pull'

add_abbr_if_not_exists gad 'git add'
add_abbr_if_not_exists gbn 'git rev-parse --abbrev-ref HEAD'
add_abbr_if_not_exists gcl 'git clean'
add_abbr_if_not_exists gcmt 'git commit -am '
add_abbr_if_not_exists gco 'git checkout'
add_abbr_if_not_exists gcob 'git checkout -b '
add_abbr_if_not_exists gcod 'git checkout develop'
add_abbr_if_not_exists gcom 'git checkout master'
add_abbr_if_not_exists get git
add_abbr_if_not_exists glg 'git log'
add_abbr_if_not_exists glog git\ log\ --Uraph\ --pretty=\'\%Cred\%h\%Creset\ -\%C\(auto\)\%d\%Creset\ \%s\ \%Cgreen\(\%ad\)\ \%C\(bold\ blue\)\<\%an\>\%Creset\'\ --date=short
add_abbr_if_not_exists gpll 'git pull'
add_abbr_if_not_exists gpristine 'git reset --hard && git clean -fdx'
add_abbr_if_not_exists gpsh 'git push'
add_abbr_if_not_exists gpsuo 'git push --set-Upstream origin (git rev-parse --abbrev-ref HEAD)'
add_abbr_if_not_exists grm 'git rm'
add_abbr_if_not_exists grv 'git remote -v'
add_abbr_if_not_exists gsh 'git stash'
add_abbr_if_not_exists gst 'git status -sb'
# add_abbr_if_not_exists gclone 'git clone git@github.com:mattmc3/'
add_abbr_if_not_exists gwhoami 'echo "user.name:" (git config user.name) && echo "user.email:" (git config user.email)'

# cli
add_abbr_if_not_exists lg lazygit
add_abbr_if_not_exists ld lazydocker
add_abbr_if_not_exists k kubectl
add_abbr_if_not_exists y yazi

# unix
add_abbr_if_not_exists mv 'mv -i'
add_abbr_if_not_exists cp 'cp -i'
add_abbr_if_not_exists mkdir 'mkdir -p'

# brew
add_abbr_if_not_exists bdump 'brew bundle dump --file=~/dotfiles/Brewfile --force'
add_abbr_if_not_exists bup 'brew update && brew upgrade && brew cleanup'
add_abbr_if_not_exists bo 'brew outdated'
add_abbr_if_not_exists bi 'brew install'
add_abbr_if_not_exists bU 'brew uninstall'
add_abbr_if_not_exists bu 'brew upgrade'
add_abbr_if_not_exists bs 'brew search'
add_abbr_if_not_exists bl 'brew deps --formula --for-each $(brew leaves) | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"'
add_abbr_if_not_exists bd 'brew deps --include-build --tree $(brew leaves)'

add_abbr_if_not_exists oc opencode

# function abbreviations
add_abbr_if_not_exists sg source_goenv
# add_abbr_if_not_exists rf reload_fish  # commented out - use exec fish instead
add_abbr_if_not_exists rf 'exec fish'
