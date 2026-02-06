function nvim-sign --description "Sign nvim and plugins for macOS Sequoia"
    codesign -f -s - /opt/homebrew/bin/nvim 2>/dev/null
    find ~/.local/share/nvim -name "*.so" -type f -exec codesign -f -s - {} \; 2>/dev/null
    echo "✓ Signed nvim and plugins"
end
