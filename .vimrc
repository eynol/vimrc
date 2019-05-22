
set nocompatible              " be iMproved, required
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



if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'junegunn/vim-plug'
Plug 'Shougo/vimfiler.vim'
call plug#end()



let g:vimfiler_as_default_explorer = 1
autocmd VimEnter * if !argc() | VimFiler | endif
let g:loaded_netrwPlugin = 1


" Map Leader key to <space>
let mapleader = "\<Space>"

" Save files
nnoremap <Leader>fw :w<CR>
nnoremap <Leader>fW :w !sudo tee %<CR>
" Strip whitespace
nnoremap <F4> :%s/\s\+$//<cr>:let @/=''<CR>


inoremap jk <Esc>
nnoremap <Leader>ft  :VimFiler -buffer-name=explorer -split -simple -winwidth=40 -toggle -no-quit<CR>


nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
