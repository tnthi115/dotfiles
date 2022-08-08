""""""""""""""""""""""""""""""""
"'########:'##::: ##:'########:"
"... ##..:: ###:: ##:... ##..::"
"::: ##:::: ####: ##:::: ##::::"
"::: ##:::: ## ## ##:::: ##::::"
"::: ##:::: ##. ####:::: ##::::"
"::: ##:::: ##:. ###:::: ##::::"
"::: ##:::: ##::. ##:::: ##::::"
":::..:::::..::::..:::::..:::::"
"      Tymon Nathaniel Thi     "
""""""""""""""""""""""""""""""""

" ▄▄▄█████▓ ███▄    █ ▄▄▄█████▓
" ▓  ██▒ ▓▒ ██ ▀█   █ ▓  ██▒ ▓▒
" ▒ ▓██░ ▒░▓██  ▀█ ██▒▒ ▓██░ ▒░
" ░ ▓██▓ ░ ▓██▒  ▐▌██▒░ ▓██▓ ░
"   ▒██▒ ░ ▒██░   ▓██░  ▒██▒ ░
"   ▒ ░░   ░ ▒░   ▒ ▒   ▒ ░░
"     ░    ░ ░░   ░ ▒░    ░
"   ░         ░   ░ ░   ░
"                   ░

" @@@@@@@  @@@  @@@  @@@@@@@
" @@@@@@@  @@@@ @@@  @@@@@@@
"   @@!    @@!@!@@@    @@!
"   !@!    !@!!@!@!    !@!
"   @!!    @!@ !!@!    @!!
"   !!!    !@!  !!!    !!!
"   !!:    !!:  !!!    !!:
"   :!:    :!:  !:!    :!:
"    ::     ::   ::     ::
"    :     ::    :      :

"""""""""""""""""""""""""""""""""""""""
"""             PLUGINS             """
"""""""""""""""""""""""""""""""""""""""
" automate installing Vim Plug
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
    " silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
"    Plug 'junegunn/seoul256.vim'
"    Plug 'junegunn/goyo.vim'
"    Plug 'junegunn/limelight.vim'

    " Gruvbox theme
    Plug 'morhetz/gruvbox'

    " Space Vim theme
    Plug 'liuchengxu/space-vim-dark'
    Plug 'liuchengxu/space-vim-theme'

    " Airline status bar
    Plug 'vim-airline/vim-airline'
"    Plug 'JamshedVesuna/vim-markdown-preview'
"   Plug 'neoclide/coc.nvim'

    " FZF fuzzy finder
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
"    Plug 'airblade/vim-rooter'

    " Tab Completion
    " Plug 'ervandew/supertab'

    " Startify start menu
    Plug 'mhinz/vim-startify'

    " NERDTree
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin' 
    Plug 'ryanoasis/vim-devicons'

    " NERDCommenter to comment out code easily with ++
    Plug 'preservim/nerdcommenter'

    " Automatically clear search highlights after you move your cursor
    Plug 'haya14busa/is.vim'

    " Code Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""
"""            STARTIFY             """
"""""""""""""""""""""""""""""""""""""""
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [ {'h': '~/.vimrc'}, {'b': '~/.bashrc'} ]

let g:startify_custom_header =
        \ startify#pad(split(system('fortune | cowsay -f $(ls /usr/share/cowsay/cows|shuf -n 1)'), '\n'))

" let g:ascii = [
      " \ '        __',
      " \ '.--.--.|__|.--------.',
      " \ '|  |  ||  ||        |',
      " \ ' \___/ |__||__|__|__|',
      " \ ''
      " \]
" let g:ascii = [
      " \ ' ▄▄▄█████▓ ███▄    █ ▄▄▄█████▓',
      " \ ' ▓  ██▒ ▓▒ ██ ▀█   █ ▓  ██▒ ▓▒',
      " \ ' ▒ ▓██░ ▒░▓██  ▀█ ██▒▒ ▓██░ ▒░',
      " \ ' ░ ▓██▓ ░ ▓██▒  ▐▌██▒░ ▓██▓ ░',
      " \ '   ▒██▒ ░ ▒██░   ▓██░  ▒██▒ ░',
      " \ '   ▒ ░░   ░ ▒░   ▒ ▒   ▒ ░░',
      " \ '     ░    ░ ░░   ░ ▒░    ░',
      " \ '   ░         ░   ░ ░   ░',
      " \ '                   ░',
      " \]
" let g:startify_custom_header =
      " \ 'startify#pad(g:ascii + startify#fortune#boxed())'

"""""""""""""""""""""""""""""""""""""""
"""           COLORSCHEME           """
"""""""""""""""""""""""""""""""""""""""
"colo horizon
"colo space_vim_theme
"colo miramare
" colo dark_purple
colo gruvbox

"""""""""""""""""""""""""""""""""""""""
"""              SETS               """
"""""""""""""""""""""""""""""""""""""""
set bg=dark

" auto indent and 4 space tabs
set expandtab
set tabstop=4
"set softtabstop=4
set shiftwidth=4
" set autoindent
set smartindent

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**

" line numbers
set number
set relativenumber

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
"set splitbelow splitright

set noswapfile
" set nobackup
" set undodir=~/.vim/undodir
" set undofile
set incsearch
"set hls
set scrolloff=8
" set nowrap
"set linespace=2

"set colorcolumn=80
set cursorline&

highlight Comment cterm=italic

" mouse can be used to change tabs
set mouse=a

" set termguicolors

"""""""""""""""""""""""""""""""""""""""
"""             REMAPS              """
"""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" fancy completion for {}, (), and []
inoremap {<CR> {<CR>}<Esc>ko
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha

" fancy ignoring of closing ), ]
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Enable and disable auto comment
" map <leader>c :setlocal formatoptions-=cro<CR>
" map <leader>C :setlocal formatoptions=cro<CR>
" 
" " Enable Disable Auto Indent
" map <leader>i :setlocal autoindent<CR>
" map <leader>I :setlocal noautoindent<CR>

" Show file tree
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pd :wincmd v<bar> :Ex<CR>

" .vimrc
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc <bar> :doautocmd BufRead<CR>

" find and replace
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again.
" Useful for replacing a few instances of the term (comparable to multiple
" cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Shell script to show the character count of the current file.
" nnoremap <leader>wc :!wc -m %<CR>

" Resize splits with arrow keys
" nnoremap <silent> <C-Left> :vertical resize -5<CR>
" nnoremap <silent> <C-Down> :res +5<CR>
" " nnoremap <silent> <C-Up> :CmdResizeUp<cr>
" nnoremap <silent> <C-Up> :res -5<CR>
" nnoremap <silent> <c-right> :vertical resize +5<CR>

"""""""""""""""""""""""""""""""""""""""
"""        Markdown Preview         """
"""""""""""""""""""""""""""""""""""""""
"let vim_markdown_preview_toggle=2
"let vim_markdown_preview_github=1
"let vim_markdown_preview_hotkey='<C-m>'


"""""""""""""""""""""""""""""""""""""""
"""           NERDTree              """
"""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 32<CR>
"nnoremap <leader>pv :NERDTreeFind<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" MUST FIX, WATCH VIDEO ABOUT IT TO GET WORKING
"""""""""""""""""""""""""""""""""""""""
"""              FZF                """
"""""""""""""""""""""""""""""""""""""""
" "" This is the default extra key bindings
" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-x': 'split',
  " \ 'ctrl-v': 'vsplit' }
"
" " Enable per-command history.
" " CTRL-N and CTRL-P will be automatically bound to next-history and
" " previous-history instead of down and up. If you don't like the change,
" " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'
"
" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>
"
"
" let g:fzf_tags_command = 'ctags -R'
" " Border color
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
"
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"
"
"
" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
  " \ 'bg':      ['bg', 'Normal'],
  " \ 'hl':      ['fg', 'Comment'],
  " \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  " \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  " \ 'hl+':     ['fg', 'Statement'],
  " \ 'info':    ['fg', 'PreProc'],
  " \ 'border':  ['fg', 'Ignore'],
  " \ 'prompt':  ['fg', 'Conditional'],
  " \ 'pointer': ['fg', 'Exception'],
  " \ 'marker':  ['fg', 'Keyword'],
  " \ 'spinner': ['fg', 'Label'],
  " \ 'header':  ['fg', 'Comment'] }
"
" "Get Files
" command! -bang -nargs=? -complete=dir Files
    " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
"
"
" " Get text in files with Rg
" command! -bang -nargs=* Rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  " \   fzf#vim#with_preview(), <bang>0)
"
" " Ripgrep advanced
" function! RipgrepFzf(query, fullscreen)
  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  " let initial_command = printf(command_fmt, shellescape(a:query))
  " let reload_command = printf(command_fmt, '{q}')
  " let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
"
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"
" " Git grep
" command! -bang -nargs=* GGrep
  " \ call fzf#vim#grep(
  " \   'git grep --line-number '.shellescape(<q-args>), 0,
  " \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"

"""""""""""""""""""""""""""""""""""""""
"""         NERDCommenter           """
"""""""""""""""""""""""""""""""""""""""
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings 
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""
"""              COC                """
"""""""""""""""""""""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" let g:lightline = {
  " \ 'colorscheme': 'wombat',
  " \ 'active': {
  " \   'left': [ [ 'mode', 'paste' ],
  " \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  " \ },
  " \ 'component_function': {
  " \   'cocstatus': 'coc#status'
  " \ },
  " \ }
"
" " Use autocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
