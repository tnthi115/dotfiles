function fish_user_key_bindings
    # Enable vim mode
    fish_vi_key_bindings

    # Custom keybindings
    # Unbind preset \el (Alt+L) in insert mode
    bind -M insert -e --preset \el

    # Visual mode: V selects entire line
    bind -m visual V beginning-of-line begin-selection end-of-line force-repaint
end
