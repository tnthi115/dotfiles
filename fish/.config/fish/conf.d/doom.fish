#
# doom emacs
#

if test -d $HOME/.config/doom
    set -gx DOOMDIR $HOME/.config/doom
end

command -v emacs >/dev/null; or return

if test -d $HOME/.emacs.d
    fish_add_path --append $HOME/.emacs.d/bin
end

if test -d $HOME/.config/emacs
    fish_add_path --append $HOME/.config/emacs/bin
end
