syntax on
set number
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smarttab 
set shiftwidth=4
set autoindent 
set cindent
set showmatch 
set ruler
set ignorecase
set nowrap
set incsearch
set exrc
set nocompatible
set path+=**
set wildmenu
set colorcolumn=90
set cursorline

hi ColorColumn ctermbg=black
hi CursorLine cterm=NONE ctermbg=black

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=10
au VimEnter * if (eval("@%") == "") | :Vexplore | endif

command! MakeTags !ctags -R .
