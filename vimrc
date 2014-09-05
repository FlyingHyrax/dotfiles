" much general stuff is handled by vim-sensible:
" https://github.com/tpope/vim-sensible
" opts that are commented out are in sensible but kept for reference
" Install vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
Plugin 'scrooloose/syntastic.git'
" comments
Plugin 'scrooloose/nerdcommenter'

" zen-coding html expansion
Plugin 'mattn/emmet-vim'
" less-css support
Plugin 'groenewege/vim-less'
" CoffeeScript support
Plugin 'kchmck/vim-coffee-script'
" Clojure support
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'

" dependencies for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" handy snippet plugin
Plugin 'garbas/vim-snipmate'
" stock snippets for the handy snippet plugin
Plugin 'honza/vim-snippets'

" solarized theme
"Plugin 'altercation/vim-colors-solarized.git'
" base16 themes
Plugin 'chriskempson/base16-vim'

call vundle#end()

filetype plugin indent on
syntax enable

" setup theme - t_Co is not required if $TERM variable is
" set correctly, and we take care of that elsewhere
let base16colorspace=256
set background=dark
colorscheme base16-monokai

" display and cue settings
set title
set number
set noshowmode " airline shows the mode
" set showcmd
" set ruler
" set laststatus=2

" tab and indentation settings
set tabstop=4 " display a tab as 4 cols
set shiftwidth=4 " number of cols for reindent ops
set softtabstop=4 " number of cols when tab is pressed
set expandtab " tabs are spaces
" set smarttab " tabs not dumb
" set autoindent " indents a new line to previous line's level
" set backspace=indent,eol,start

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
" set incsearch
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
