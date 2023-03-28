set nocompatible              " be iMproved, required
filetype plugin indent on                  " required




" VIM primary setting
" set numbero
set relativenumber 
set backspace=indent,eol,start
set hlsearch
set ruler
set scrolloff=7
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
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



" Netrw list style: tree
let g:netrw_liststyle=3

" GUI settings
if has('gui_running')
  " set guifont=Consolas:h12:cANSI:qDRAFT
  " source $VIMRUNTIME/delmenu.vim
  " source $VIMRUNTIME/menu.vim
endif



" Plugin manager install
if empty(glob('~/.vim/autoload/plug.vim'))
  if has('mac')
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif





" Map Leader key to <space>
let mapleader = "\<Space>"

" Save files
nnoremap <Leader>fs :w<CR> " file save
nnoremap <Leader>fss :w !sudo tee %<CR>


" Config file
nnoremap <Leader>cr :source ~/.vim/vimrc<CR>

" Strip whitespace
nnoremap <F4> :%s/\s\+$//<cr>:let @/=''<CR>

inoremap jk <Esc>



" Functions if needed
" Allow to trigger background
function! ToggleBG()
  let s:tbg = &background
  " Inversion
  if s:tbg == "dark"
    set background=light
    colorscheme morning
  else
    set background=dark
    colorscheme molokai
  endif
endfunction