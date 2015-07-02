" Many settings that would otherwise be in here are covered by vim-sensible
" Vundle doesn't work with fish (*sniffle), so you need to run Vundle commands
" from bash/sh. From bash, you can use 'env SHELL=`which bash` vim +PluginInstall!" to trigger an install/update.

" pre-vundling settings:
if &shell =~# 'fish$'
    set shell=bash
endif
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'gmarik/Vundle.vim'
" file and buffer switching
Plugin 'kien/ctrlp.vim'
" awesome status line
Plugin 'bling/vim-airline'
" some nice vimrc defaults
Plugin 'tpope/vim-sensible'
" git integration
Plugin 'tpope/vim-fugitive'

" handling parens
Plugin 'tpope/vim-surround'
" linting
" Plugin 'scrooloose/syntastic.git'
" comments
" Plugin 'scrooloose/nerdcommenter'
" fish shell support (maybe)
Plugin 'dag/vim-fish'
" Swift language
Plugin 'keith/swift.vim'

" zen-coding html expansion
Plugin 'mattn/emmet-vim'
" less-css support
Plugin 'groenewege/vim-less'
" CoffeeScript support
Plugin 'kchmck/vim-coffee-script'
" Clojure support
" Plugin 'guns/vim-clojure-static'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-leiningen'
" Plugin 'tpope/vim-fireplace'

" dependencies for snipmate
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" handy snippet plugin
" Plugin 'garbas/vim-snipmate'
" stock snippets for the handy snippet plugin
" Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on
syntax enable

set t_Co=256
set background=dark
colorscheme zenburn

" display and cue settings
set title
set number
set noshowmode " airline shows the mode

" tab and indentation settings
set tabstop=4 " display a tab as 4 cols
set shiftwidth=4 " number of cols for reindent ops
set softtabstop=4 " number of cols when tab is pressed
set expandtab " tabs are spaces

" line wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" search settings
set ignorecase
set smartcase
set gdefault
set hlsearch

" instead of turning backups off, put them in their own directory
set backup
set backupdir=~/backup/vim
set directory=~/backup/vim/swap
set viewdir=~/backup/vim/views

" mappings so we don't have to hit shift so often
map q; q:
noremap ; :
" To rempap the leader from default '\'
" let mapleader = ","

" hotkey for paste mode
nnoremap <leader>p :set paste!<CR>

" hotkey toggle whitespace indicators
nmap <silent> <leader>s :set nolist!<CR>
set listchars=tab:▷\ ,trail:.,eol:¬

" we'll be overwriting Sensible's 'nohlsearch' hotkey; use another instead
nnoremap <leader>hl :set hlsearch!<CR>

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

" sets up special font for Airline
let g:airline_powerline_fonts = 1

" Strip trailing whitespace from all lines when saving
autocmd BufWritePre * :%s/\s\+$//e
