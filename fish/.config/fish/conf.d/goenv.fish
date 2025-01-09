set -gx goenv_warning false

if type -q go
    if type -q goenv
        # Helper variable for calling source_goenv
        # set -gx GO_DIRS_PROCESSED

        # Golang version management using goenv
        # https://github.com/go-nv/goenv/blob/master/ENVIRONMENT_VARIABLES.md
        set -gx GOENV_GOMOD_VERSION_ENABLE 1

        if test -e go.mod -o -e go.sum -o (count *.go) -gt 0
            if test "$goenv_warning" = true
                set -f go_version (go version | awk '{print $3}' | sed 's/go//; s/\(\.[0-9]*\)\.[0-9]*$/\1/')
                set -f goenv_local (goenv local | sed 's/\(\.[0-9]*\)\.[0-9]*$/\1/')
                if test $go_version != $goenv_local
                    set -l error_message "mismatching go versions:\n\t$go_version != $goenv_local\n\nrun `source_goenv` to update"
                    echo -e $error_message
                end
            else
                source_goenv
            end

            # set -gx GOENV_ROOT "$HOME/.goenv"
            # fish_add_path --prepend --path "$GOENV_ROOT/bin"
            # status --is-interactive; and source (goenv init -|psub)
            # fish_add_path --prepend --path "$GOROOT/bin"
            # fish_add_path --append --path "$GOPATH/bin"
        end

    else
        # Add go path to path
        # set -gx GOPATH "/usr/lib/go"
        # set -gx GOPATH "$HOME/go"
        # set -gx GOPATH "$HOME/.local/lib/go"
        fish_add_path --append "$(go env GOPATH)/bin"
        set -gx GOPATH "$(go env GOPATH)"
    end
end
