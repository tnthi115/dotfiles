# Initialize zoxide for fast jumping with 'z'.

type -q zoxide || return 1
zoxide init --cmd cd fish | source

# Like setopt AUTO_PUSHD in zsh
# function myfunc --on-variable PWD
#     echo Changed!
# end
