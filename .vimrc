"   Tern config
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_move'
let g:tern_map_prefix=','



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



" color bracket
Plugin 'kien/rainbow_parentheses.vim'

" Syntax For Nginx
Plugin 'nginx.vim'

" HTML &  CSS
Plugin 'vim-stylus'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-pug'

" JAVASCRIPT
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'
"Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'ternjs/tern_for_vim'



Plugin 'tomasr/molokai'
Plugin 'sheerun/vim-polyglot'

" UI Stuff
Plugin 'itchyny/lightline.vim'

" Plug for git
Plugin 'tpope/vim-fugitive'


" Plugin 'tpope/vim-fugitive'
" Plugin 'L9'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ascenator/L9', {'name': 'newL9'}




call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

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

set confirm
set showcmd

" Key maps
let mapleader = "\<Space>"

" Write files
nnoremap <Leader>w :w<CR>
nnoremap <Leader>sw :w !sudo tee %<CR>
nnoremap <F4> :%s/\s\+$//<cr>:let @/=''<CR>




set sessionoptions+=unix,slash

" terminal setting
set t_Co=256
set background=dark
colorscheme molokai


set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99


" netrw list style
"
"
"
let g:netrw_liststyle=3


set encoding=utf-8
set laststatus=2

if has('gui_running')
  set guifont=Consolas:h12:cANSI:qDRAFT
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

" light line setting
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '├'.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



" abbreviate
iabbrev #b /****************************************
iabbrev #e <Space>****************************************/

" Prevent mistakes
iabbrev teh the
iabbrev funtcion function
iabbrev funtion function
iabbrev funcetion function
iabbrev funciton function
