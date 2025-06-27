function __is_file_changed_in_git__ --argument-names file_path
    # Suppress return status output
    set -l __fish_disable_status_print 1

    # Check if we're in a git repository, silencing all output
    if not git -C (dirname $file_path) rev-parse --is-inside-work-tree >/dev/null 2>&1
        # If not in a git repo, consider all files as changed (fallback behavior)
        return 0
    end

    # Get the git repository root directory
    set -l git_root (git -C (dirname $file_path) rev-parse --show-toplevel)

    # Convert absolute path to path relative to git root
    set -l rel_path (string replace -r "^$git_root/" "" -- $file_path)

    # Check file status using git status --porcelain
    set -l file_status (git -C $git_root status --porcelain -- "$rel_path")

    # `test -n` returns 0 (success) if git status outputs anything (i.e., the file is changed).
    test -n "$file_status"
    return $status
end

function __source_dotfiles__ --argument-names base_path
    if test -d $base_path
        echo (set_color blue --bold)"Sourcing dotfiles from $base_path..."(set_color normal)

        set -l function_dir $base_path/.config/fish/functions
        if test -d $function_dir
            echo (set_color yellow)"   Sourcing functions..."(set_color normal)
            set -l function_files (find $function_dir -name "*.fish")
            for file in $function_files
                if __is_file_changed_in_git__ $file
                    echo "     "(basename $file)
                    source $file; or echo (set_color red --bold)"     Error sourcing "(basename $file)(set_color normal)
                else
                    echo "     "(set_color cyan)(basename $file)" (unchanged, skipping)"(set_color normal)
                end
            end
        end

        set -l config_dir $base_path/.config/fish/conf.d
        if test -d $config_dir
            echo (set_color yellow)"   Sourcing configurations..."(set_color normal)
            set -l config_files (find $config_dir -name "*.fish")
            for file in $config_files
                if __is_file_changed_in_git__ $file
                    echo "     "(basename $file)
                    source $file; or echo (set_color red --bold)"     Error sourcing "(basename $file)(set_color normal)
                else
                    echo "     "(set_color cyan)(basename $file)" (unchanged, skipping)"(set_color normal)
                end
            end
        end
    end
end

function reload_fish --description "reload fish configuration"
    echo (set_color green --bold)"Reloading fish configuration..."(set_color normal)

    # Source personal and work dotfiles
    __source_dotfiles__ ~/dotfiles/fish
    __source_dotfiles__ ~/work-dotfiles/fish

    # Reload the main config.fish file if it exists and has changed
    set -l main_config ~/dotfiles/fish/.config/fish/config.fish
    if test -f $main_config
        echo (set_color blue --bold)"Checking main config.fish..."(set_color normal)
        if __is_file_changed_in_git__ $main_config
            echo (set_color yellow)"   Sourcing "(basename $main_config)(set_color normal)
            source $main_config
        else
            echo (set_color cyan)"   "(basename $main_config)" (unchanged, skipping)"(set_color normal)
        end
    end

    echo (set_color green --bold)"Fish configuration reloaded!"(set_color normal)
end
