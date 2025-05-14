function cd --wraps=__zoxide_z --description 'alias cd=__zoxide_z'
    __zoxide_z $argv

    # Push the resulting directory to the stack
    if test "$status" -eq 0 # Only run pushd if the jump was successful
        pushd . >/dev/null
    end
end
