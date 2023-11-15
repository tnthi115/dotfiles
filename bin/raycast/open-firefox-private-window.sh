#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Firefox Private Window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Open a private Firefox window.
# @raycast.author Tymon
# @raycast.authorURL https://github.com/tnthi115

open -n -a Firefox --args -private-window -P "hardened"
