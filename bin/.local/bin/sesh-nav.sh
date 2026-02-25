#!/usr/bin/env bash
# Navigate tmux sessions in sesh list order (circular)
# Usage: sesh-nav.sh [next|prev]

set -euo pipefail

direction="${1:-next}"
if [[ "$direction" != "next" && "$direction" != "prev" ]]; then
    echo "Usage: $0 [next|prev]" >&2
    exit 1
fi
current_session=$(tmux display-message -p '#S')

# Get active tmux sessions in sesh order
sessions=()
while IFS= read -r session; do
    [[ -n "$session" ]] && sessions+=("$session")
done < <(sesh list -t)

# Find current session index
current_idx=-1
for i in "${!sessions[@]}"; do
    if [[ "${sessions[$i]}" == "$current_session" ]]; then
        current_idx=$i
        break
    fi
done

# If current session not found, do nothing
[[ $current_idx -eq -1 ]] && exit 0

# Calculate target index (circular)
total=${#sessions[@]}
if [[ "$direction" == "next" ]]; then
    target_idx=$(( (current_idx + 1) % total ))
else
    target_idx=$(( (current_idx - 1 + total) % total ))
fi

# Switch to target session
target_session="${sessions[$target_idx]}"
tmux switch-client -t "$target_session"
