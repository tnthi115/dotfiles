#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
type -q starship || return 1
starship init fish | source
