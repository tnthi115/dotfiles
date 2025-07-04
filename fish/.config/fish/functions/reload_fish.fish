# This file was written by AI (mix of avante.nvim and opencode)

function reload_fish --description "reload fish configuration"
    echo "- Reloading fish configuration..."(set_color normal)

    # Get all changed files from both repos upfront
    set -l dotfiles_changed (cd ~/dotfiles && git status --porcelain | grep -v "^??")
    set -l work_dotfiles_changed (cd ~/work-dotfiles 2>/dev/null && git status --porcelain | grep -v "^??")

    # Source files from dotfiles and work-dotfiles
    __reload_dotfiles ~/dotfiles/fish "$dotfiles_changed"
    __reload_dotfiles ~/work-dotfiles/fish "$work_dotfiles_changed"

    # Source main config.fish if it exists
    set -l main_config ~/dotfiles/fish/.config/fish/config.fish
    if test -f $main_config
        echo "- Checking main config.fish..."
        # Check if the file has changed
        set -l is_changed 0
        if string match -q "* fish/.config/fish/config.fish*" "$dotfiles_changed"
            set is_changed 1
        end

        if test $is_changed -eq 1
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

function __reload_dotfiles --argument-names base_path git_changed
    if test -d "$base_path"
        echo "- Sourcing dotfiles from "(set_color blue --bold)$base_path(set_color normal)"..."

        # Support both directory structures:
        # 1. ~/dotfiles/fish/.config/fish/{functions,conf.d}
        # 2. ~/work-dotfiles/fish/{functions,conf.d}

        # Check if .config/fish exists
        if test -d "$base_path/.config/fish"
            # Source files in .config/fish/functions directory
            __reload_files "$base_path/.config/fish/functions" "fish/.config/fish/functions" "$git_changed"

            # Source files in .config/fish/conf.d directory
            __reload_files "$base_path/.config/fish/conf.d" "fish/.config/fish/conf.d" "$git_changed"
        else
            # Source files directly in functions directory
            __reload_files "$base_path/functions" fish/functions "$git_changed"

            # Source files directly in conf.d directory
            __reload_files "$base_path/conf.d" "fish/conf.d" "$git_changed"
        end
    end
end

function __reload_files --argument-names dir_path repo_rel_path git_changed
    if test -d "$dir_path"
        echo (set_color yellow)"  > Sourcing files from "(basename "$dir_path")(set_color normal)

        # Get list of fish files in directory
        set -l files (find "$dir_path" -maxdepth 1 -name "*.fish" 2>/dev/null | sort)

        for file in $files
            set -l file_name (basename "$file")
            set -l rel_file_path "$repo_rel_path/$file_name"

            # Check if file has changed in git
            set -l is_changed 0
            for line in $git_changed
                if string match -q "*$rel_file_path*" "$line"
                    set is_changed 1
                    break
                end
            end

            if test $is_changed -eq 1
                echo "    > "$file_name
                if source "$file"
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
