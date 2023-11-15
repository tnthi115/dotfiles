#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch Hardened Firefox
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Launch Firefox with my hardened profile.
# @raycast.author Tymon
# @raycast.authorURL https://github.com/tnthi115

open -n -a Firefox --args -window -P "hardened"
