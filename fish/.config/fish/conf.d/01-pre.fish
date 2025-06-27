#
# pre - First things first.
#

# Add keg-only apps
# for app in ruby curl sqlite
#     if test -d "$HOMEBREW_PREFIX/opt/$app/bin"
#         fish_add_path "$HOMEBREW_PREFIX/opt/$app/bin"
#         set MANPATH "$HOMEBREW_PREFIX/opt/$app/share/man" $MANPATH
#     end
# end

# Add homebrew completions
if test -e "$HOMEBREW_PREFIX/share/fish/completions"
    set -a fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
end

# Other homebrew vars.
set -gx HOMEBREW_NO_ANALYTICS 1

# Add more man page paths.
for manpath in (path filter $__fish_data_dir/man /usr/local/share/man /usr/share/man)
    set -a MANPATH $manpath
end

# Allow subdirs for functions and completions.
set -l func_subdirs $__fish_config_dir/functions/*/
if test -e "$func_subdirs[1]"
    set fish_function_path (path resolve $func_subdirs) $fish_function_path
end

# Add bin directories to path.
# fish_add_path --prepend $HOME/.local/bin
# fish_add_path --prepend $HOME/go/bin
# fish_add_path --prepend $HOME/bin
