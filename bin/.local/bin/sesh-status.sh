#!/usr/bin/env bash
# Output session navigation status: prev ← current → next
# Usage: sesh-status.sh

set -euo pipefail

current_session=$(tmux display-message -p '#S')

# Get active tmux sessions in sesh order
sessions=()
while IFS= read -r session; do
    [[ -n "$session" ]] && sessions+=("$session")
done < <(sesh list -t)

total=${#sessions[@]}

# If only one session or current not found, just show current
if [[ $total -le 1 ]]; then
    echo "$current_session"
    exit 0
fi

# Find current session index
current_idx=-1
for i in "${!sessions[@]}"; do
    if [[ "${sessions[$i]}" == "$current_session" ]]; then
        current_idx=$i
        break
    fi
done

# If current session not found in sesh list, just show current
if [[ $current_idx -eq -1 ]]; then
    echo "$current_session"
    exit 0
fi

# Calculate prev/next (circular)
prev_idx=$(( (current_idx - 1 + total) % total ))
next_idx=$(( (current_idx + 1) % total ))

prev_session="${sessions[$prev_idx]}"
next_session="${sessions[$next_idx]}"

echo "${prev_session} ← ${current_session} → ${next_session}"
