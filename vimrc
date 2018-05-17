runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set nocompatible

filetype on
filetype indent on
filetype plugin on


syntax on
set relativenumber
set number
set incsearch
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
set noswapfile
set cursorline
set spelllang=en_us,de_de

set showmatch

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set bg=dark
"set bg=light
colorscheme gruvbox
"let g:solarized_termcolors=256
"colorscheme solarized
"colo seoul256
let g:seoul256_background = 236



" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
autocmd FileType tex set fdm=marker 
autocmd FileType tex set foldmarker={{{,}}} 
set clipboard=unnamed
" to fix background rendering issue in tmux
set t_ut=

autocmd FileType python nnoremap <buffer> <F5> :VimuxRunCommand("clear; python3 ". bufname("%"))<CR>

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

so ~/.dotfiles/vim/vimlatex-overrules.vim
