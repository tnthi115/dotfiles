function swenv --description "switch python virtual environments"
    # Check if deactivate exists and run it if so
    if command -v deactivate &>/dev/null
        deactivate
    end

    set venv_path_list (".")
    # venv_path_list=($HOME/.venv $HOME/venvs)
    # [ -d "$HOME/venvs" ] && set -a venv_path_list $HOME/venvs
    if test -d "$HOME/venvs"
        set -a venv_path_list $HOME/venvs
    end

    # Find all directories containing pyvenv.cfg
    set venv (printf "%s\n" $venv_path_list | xargs -I {} find {} -type f -name "pyvenv.cfg" -exec dirname {} \; | fzf)

    # Source the selected virtual environment
    source $venv/bin/activate
end
