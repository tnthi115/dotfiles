#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run shell command
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "command" }

# Documentation:
# @raycast.description Run a shell command in the terminal.
# @raycast.author Tymon
# @raycast.authorURL https://github.com/tnthi115

# echo "Hello World! Argument1 value: "$1""

# echo "all arguments:" "$@"

wezterm start -- $@

# WIP: this currently doesn't have the same environment as a normal terminal (not same login shell?)
