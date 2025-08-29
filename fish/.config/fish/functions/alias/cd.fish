function cd --wraps=__zoxide_z --description 'alias cd=__zoxide_z'
    set -l old_pwd $PWD
    __zoxide_z $argv

    # Push the previous directory to the stack (like pushd does)
    if test "$status" -eq 0 # Only update stack if the jump was successful
        set -g -p dirstack $old_pwd
    end
end
