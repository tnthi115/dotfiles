function __get_changed_files__ --argument-names base_path
    set -l git_root
    set -l git_status

    if git -C $base_path rev-parse --is-inside-work-tree >/dev/null 2>&1
        set git_root (git -C $base_path rev-parse --show-toplevel)
        set git_status (git -C $git_root status --porcelain)
    else
        return 1
    end
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

        function __source_files__ --argument-names dir_path changed_files in_git_repo
            if test -d $dir_path
                echo (set_color yellow)"  > Sourcing files from "(basename $dir_path)(set_color normal)
                set -l files (ls $dir_path/*.fish)
                for file in $files
                    set -l file_name (basename $file)
                    if __file_is_changed__ $file $changed_files $in_git_repo
                        echo "    > "$file_name
                        if source $file
                            echo "      "(set_color green)"✓ Sourced "$file_name(set_color normal)
                        else
                            echo "      "(set_color red --bold)"Error sourcing "$file_name(set_color normal)
                        end
                    else
                        echo "    ~ "$file_name" (unchanged, skipping)"
                    end
                end
            end
        end

        __source_files__ $base_path/.config/fish/functions $changed_files $in_git_repo
        __source_files__ $base_path/.config/fish/conf.d $changed_files $in_git_repo
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
