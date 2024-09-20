function vs --description "neovim config switcher"
    # Assumes all configs exist in directories named ~/.config/nvim-*
    config (fd --max-depth 1 . ~/.config/nvim-configs | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

    # If I exit fzf without selecting a config, don't open Neovim
    if test -z "$config"
        echo "No config selected"
        return
    end

    # Open Neovim with the selected config
    NVIM_APPNAME (string split -n -c1 "$config")[1]
    nvim
end
