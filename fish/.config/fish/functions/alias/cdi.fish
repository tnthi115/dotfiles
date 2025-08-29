function cdi --wraps=__zoxide_zi --description 'alias cdi=__zoxide_zi'
    set -l old_pwd $PWD
    __zoxide_zi $argv

    # Push the previous directory to the stack (like pushd does)
    if test "$status" -eq 0 # Only update stack if the jump was successful
        set -g -p dirstack $old_pwd
    end
end
