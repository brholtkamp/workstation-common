" dein ---------------------------------------
if &compatible
    set nocompatible
endif

if !isdirectory("~/.vim/")
    call system("git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/repos/github.com/Shougo/dein.vim")
endif

set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/bundle/'))
call dein#add('Shougo/dein.vim')                    " Package manager

" Plugins
call dein#add('scrooloose/nerdtree')                " File browser (Ctrl+f)
call dein#add('ctrlpvim/ctrlp.vim')                 " File search (Ctrl+P)
call dein#add('bling/vim-bufferline')               " Adds buffers to the status bar
call dein#add('JamshedVesuna/vim-markdown-preview') " Allows previews of .md files (Ctrl+M)

" Theming
call dein#add('flazz/vim-colorschemes')             " Colors!
call dein#add('vim-airline/vim-airline')            " Status bar
call dein#add('vim-airline/vim-airline-themes')     " More colors!
call dein#add('edkolev/tmuxline.vim')               " Color theme for tmux
call dein#add('airblade/vim-gitgutter')             " Git line status
call dein#add('ntpeters/vim-airline-colornum')      " Adds the status bar color to the current line

" Syntax handling
call dein#add('editorconfig/editorconfig-vim')      " Loads ~/.editorconfig

" Syntax highlighting
call dein#add('markcornick/vim-bats')               " Syntax highlighting for Bash Automated Testing System
call dein#end()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif
" dein ---------------------------------------

" Vim settings
syntax on
set number
set smarttab
set autochdir
set mouse=a
set backspace=indent,eol,start
set cursorline

" Misc Settings
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Plugins
" CtrlP settings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPMRU'

" NERDTree settings
map <c-f> :NERDTreeToggle<CR>

" vim-markdown-preview settings
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<c-m>'
let_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" Theming
" Theme settings
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" Windows settings
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" GVim/MacVim settings
set guifont=Terminus\ (TTF):h9
set guioptions-=r
set guioptions-=L

" Airline settings
set laststatus=2 " Always show the statusline
set wildmenu " Tab completion within airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='tomorrow'

" Tmuxline settings
let g:tmuxline_powerline_separators=0

" Enable traversal of softwrapped lines
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" Render tabs and spaces
map <c-i> :set list!<CR>
set list
set listchars=tab:»·,trail:·,precedes:·,extends:·,eol:¬
