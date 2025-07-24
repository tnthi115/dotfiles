if test -d ~/work-dotfiles/fish/functions
    for file in ~/work-dotfiles/fish/functions/*.fish
        if test -f $file
            source $file
        end
    end
end

if test -d ~/work-dotfiles/fish/conf.d
    for file in ~/work-dotfiles/fish/conf.d/*.fish
        if test -f $file
            source $file
        end
    end
end
