function fish_user_key_bindings
    # bind -e --preset \el
    # bind -M default -e --preset \el
    bind -M insert -e --preset \el
    # bind -M visual -e --preset \el

    bind -m visual V beginning-of-line begin-selection end-of-line force-repaint
    # bind -m visual V commandline --set-selection 0 (commandline -L)
    # bind -M visual \cC fish_clipboard_copy
end
