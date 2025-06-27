function reload_fish --description "reload fish configuration"
    echo (set_color green --bold)"Reloading fish configuration..."(set_color normal)

    function source_dotfiles --argument-names base_path
        if test -d $base_path
            echo (set_color blue --bold)"Sourcing dotfiles from $base_path..."(set_color normal)

            # Source functions first
            set -l function_files $base_path/.config/fish/functions/*.fish
            if count $function_files >/dev/null
                echo (set_color yellow)" - Sourcing functions..."(set_color normal)
                for file in $function_files
                    echo "   - "(basename $file)
                    source $file 2>/dev/null; or echo (set_color red --bold)"     Error sourcing "(basename $file)(set_color normal)
                end
            end

            # Then source configs
            set -l config_files $base_path/.config/fish/conf.d/*.fish
            if count $config_files >/dev/null
                echo (set_color yellow)" - Sourcing configurations..."(set_color normal)
                for file in $config_files
                    echo "   - "(basename $file)
                    source $file 2>/dev/null; or echo (set_color red --bold)"     Error sourcing "(basename $file)(set_color normal)
                end
            end
        end
    end

    # Source personal and work dotfiles
    source_dotfiles ~/dotfiles/fish
    source_dotfiles ~/work-dotfiles/fish

    # Reload the main config.fish file
    if test -f ~/.config/fish/config.fish
        echo (set_color blue --bold)"Sourcing main config.fish..."(set_color normal)
        source ~/.config/fish/config.fish
    end

    echo (set_color green --bold)"Fish configuration reloaded!"(set_color normal)
end

abbr -a -- rf reload_fish
