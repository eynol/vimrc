
set nocompatible              " be iMproved, required
filetype off                  " required
"set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on    " required

set number
set backspace=indent,eol,start
set hlsearch
set ruler
set scrolloff=7
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
syntax on
set cursorline
" set cursorcolumn
set autoindent
set fencs=utf-8,gbk,c935

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set confirm
set showcmd
set encoding=utf-8
set laststatus=2

" Map Leader key to <space>
let mapleader = "\<Space>"

" Save files
nnoremap <Leader>fw :w<CR>
nnoremap <Leader>fW :w !sudo tee %<CR>
" Strip whitespace
nnoremap <F4> :%s/\s\+$//<cr>:let @/=''<CR>

" Make Session file compatible
set sessionoptions+=unix,slash
" terminal setting
set t_Co=256
" UI & color scheme
set background=dark

set foldenable
set foldmethod=indent       "  see :help foldmethod
set foldlevel=99

if has('gui_running')
  set guifont=Consolas:h12:cANSI:qDRAFT
  " source $VIMRUNTIME/delmenu.vim
  " source $VIMRUNTIME/menu.vim
endif
