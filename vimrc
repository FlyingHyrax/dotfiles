" much general stuff is handled by vim-sensible:
" https://github.com/tpope/vim-sensible
" opts that are commented out are in sensible but kept for reference
" Install vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
" we can specify a custom path for Vundle'd plugins:
" let path = '~/some/path/here'
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized.git'


filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

" mappings so we don't have to hit shift so often
map q; q:
noremap ; :
" set leader to something easier to get to
" let mapleader = ","

" instead of turning backups off, put them in their own directory
set backup
set backupdir=~/backup/vim
set directory=~/backup/vim/swap
set viewdir=~/backup/vim/views

" tab and indentation settings
set tabstop=4 " display a tab as 4 cols
set shiftwidth=4 " number of cols for reindent ops
set softtabstop=4 " number of cols when tab is pressed
set expandtab " tabs are spaces
" set smarttab " tabs not dumb
" set autoindent " indents a new line to previous line's level
" set backspace=indent,eol,start

" display and cue settings (should experiment w/ these more)
set title
set number
set showmode
" set showcmd
" set ruler
" set laststatus=2

" search settings
set ignorecase
set smartcase
set gdefault
" set incsearch
set hlsearch 

" line wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" hotkey for paste mode
nnoremap <leader>p :set paste!<CR>

" hotkey toggle whitespace indicators
nmap <silent> <leader>s :set nolist!<CR>

" Useful mappings for splits.
" <leader>w opens a new vertical split.
nnoremap <leader>w <C-w>v<C-w>l
" Ctrl-hjkl navigates windows.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" associate '.md' with markdown
au BufRead,BufNewFile *.md set filetype=markdown

" less compilation
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
