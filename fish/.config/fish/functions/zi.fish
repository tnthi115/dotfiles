function zi --wraps=__zoxide_zi --description 'alias cdi=__zoxide_zi'
    __zoxide_zi $argv

    # Push the resulting directory to the stack
    if test "$status" -eq 0 # Only run pushd if the jump was successful
        pushd . >/dev/null
    end
end
