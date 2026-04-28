function disk-clean-safe
    echo "=== Safe Disk Cleanup ==="
    go clean -cache
    go clean -modcache
    brew cleanup --prune=all
    pip cache purge 2>/dev/null
    npm cache clean --force 2>/dev/null
    echo "=== Cleanup Complete ==="
    df -h /
end
