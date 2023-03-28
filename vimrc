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


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'tpope/vim-unimpaired'
" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


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
