#
# abbrs - like aliases
#

set -q MY_ABBRS_INITIALIZED; and return

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
abbr -a -- tree 'lsd --tree'

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

# brew
abbr -a -- brewup 'brew bundle dump --file=~/dotfiles/Brewfile --force'

# unix
abbr -a -- mv 'mv -i'
abbr -a -- cp 'cp -i'
abbr -a -- mkdir 'mkdir -p'

# brew
abbr -a -- bup 'brew update && brew upgrade && brew cleanup'
abbr -a -- bo 'brew outdated'
abbr -a -- bi 'brew install'
abbr -a -- bU 'brew uninstall'
abbr -a -- bu 'brew upgrade'
abbr -a -- bs 'brew search'

# no need to run over-and-over
set -g MY_ABBRS_INITIALIZED true
