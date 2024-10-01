#
# Neofetch on startup
#

return 1

type -q neofetch || return 1
neofetch
