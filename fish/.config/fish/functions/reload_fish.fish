function __get_changed_files__ --argument-names base_path
    if not git -C $base_path rev-parse --is-inside-work-tree >/dev/null 2>&1
        return 1
    end

    set -l git_root (git -C $base_path rev-parse --show-toplevel)
    set -l git_status (git -C $git_root status --porcelain)
    set -l changed_files

    for line in (string split '\n' $git_status)
        set -l rel_path (string sub --start 4 -- $line)
        set -l abs_path (path resolve "$git_root/$rel_path")
        if test -n "$abs_path"
            set changed_files $changed_files $abs_path
        end
    end

    printf "%s\n" $changed_files
    return 0
end

function __file_is_changed__ --argument-names file_path changed_files in_git_repo
    set -q in_git_repo; or set in_git_repo 0
    if test $in_git_repo -ne 0
        return 0
    end

    set -l abs_file_path (path resolve $file_path)
    if contains $abs_file_path $changed_files
        return 0
    end

    return 1
end

function __source_dotfiles__ --argument-names base_path
    if test -d $base_path
        echo "- Sourcing dotfiles from "(set_color blue --bold)$base_path(set_color normal)"..."

        set -l changed_files (__get_changed_files__ $base_path)
        set -l in_git_repo $status

        set -l function_dir $base_path/.config/fish/functions
        if test -d $function_dir
            echo (set_color yellow)"  > Sourcing functions..."(set_color normal)
            set -l function_files (find $function_dir -name "*.fish")
            for file in $function_files
                if __file_is_changed__ $file $changed_files $in_git_repo
                    echo "    > "(basename $file)
                    if source $file
                        echo "      "(set_color green)"✓ Sourced "(basename $file)(set_color normal)
                    else
                        echo (set_color red --bold)"      Error sourcing "(basename $file)(set_color normal)
                    end
                else
                    echo "    - "(basename $file)" (unchanged, skipping)"
                end
            end
        end

        set -l config_dir $base_path/.config/fish/conf.d
        if test -d $config_dir
            echo (set_color yellow)"  > Sourcing configurations..."(set_color normal)
            set -l config_files (find $config_dir -name "*.fish")
            for file in $config_files
                if __file_is_changed__ $file $changed_files $in_git_repo
                    echo "    > "(basename $file)
                    if source $file
                        echo "      "(set_color green)"✓ Sourced "(basename $file)(set_color normal)
                    else
                        echo (set_color red --bold)"      Error sourcing "(basename $file)(set_color normal)
                    end
                else
                    echo "    - "(basename $file)" (unchanged, skipping)"
                end
            end
        end
    end
end

function reload_fish --description "reload fish configuration"
    echo "- Reloading fish configuration..."(set_color normal)

    __source_dotfiles__ ~/dotfiles/fish
    __source_dotfiles__ ~/work-dotfiles/fish

    set -l main_config ~/dotfiles/fish/.config/fish/config.fish
    if test -f $main_config
        echo "- Checking main config.fish..."
        set -l config_changed_files (__get_changed_files__ (dirname $main_config))
        set -l in_git_repo $status

        if __file_is_changed__ $main_config $config_changed_files $in_git_repo
            echo (set_color yellow)"  > Sourcing "(basename $main_config)(set_color normal)
            if source $main_config
                echo "    "(set_color green)"✓ Sourced "(basename $main_config)(set_color normal)
            else
                echo (set_color red --bold)"    Error sourcing "(basename $main_config)(set_color normal)
            end
        else
            echo "  - "(basename $main_config)" (unchanged, skipping)"
        end
    end

    echo (set_color green --bold)"✓ Fish configuration reloaded!"(set_color normal)
end
