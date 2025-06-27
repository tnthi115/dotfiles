set -gx goenv_pwd_change_warning true

function source_goenv --description "source (goenv init -|psub)"
    set -gx GOENV_ROOT "$HOME/.goenv"
    set -gx PATH $GOENV_ROOT/bin $PATH
    status --is-interactive; and source (goenv init -|psub)
    set -gx PATH $GOROOT/bin $PATH
    set -gx PATH $PATH $GOPATH/bin
end

function is_subdir
    for dir in $argv[2]
        if string match -r $dir $argv[1]
            return 0
        end
    end
    return 1
end

function on_pwd_change --on-variable PWD
    if test -e go.mod -o -e go.sum -o (count *.go) -gt 0
        if test "$goenv_pwd_change_warning" = true
            set -f go_version (go version | awk '{print $3}' | sed 's/go//; s/\(\.[0-9]*\)\.[0-9]*$/\1/')
            set -f goenv_local (goenv local | sed 's/\(\.[0-9]*\)\.[0-9]*$/\1/')
            # if test $go_version != $goenv_local && not contains $PWD $GO_DIRS_PROCESSED && not is_subdir $PWD $GO_DIRS_PROCESSED
            # if test $go_version != $goenv_local && not is_subdir $PWD $GO_DIRS_PROCESSED
            if test $go_version != $goenv_local
                set -l error_message "mismatching go versions:\n\t$go_version != $goenv_local\n\nrun `source_goenv` to update"
                echo -e $error_message
                # echo source_goenv
                # source_goenv

                # if contains $PWD $GO_DIRS_PROCESSED
                #     set -a GO_DIRS_PROCESSED $PWD
                # end
            end
        else
            source_goenv
        end
    end
end
