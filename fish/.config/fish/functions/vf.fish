function vf --description "fzf a file and open in nvim"
    if type -q bat
        nvim (fzf --preview='bat --style=numbers --color=always --line-range :500 {}')
    else
        nvim (fzf --preview='cat {}')
    end
end
