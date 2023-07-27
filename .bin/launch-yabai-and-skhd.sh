#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch yabai and skhd
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Tymon

# yabai --stop-service
# skhd --stop-service
# yabai --start-service
# skhd --start-service

if pgrep skhd; then
    killall skhd
fi

if pgrep yabai; then
    killall yabai
fi

skhd&
yabai&
