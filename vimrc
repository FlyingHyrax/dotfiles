" Vim needs a POSIX shell, which Fish isn't
if &shell =~# 'fish$'
    set shell=bash
endif
set nocompatible

" Start plugin installation sectons
" Pass the directory in which we want plugins installed
" (the 'bundle' directory is where Vundle kept plugins)
call plug#begin('~/.vim/bundle')

" some nice vimrc defaults
Plug 'tpope/vim-sensible'
" git integration
Plug 'tpope/vim-fugitive'
" file and buffer switching
Plug 'kien/ctrlp.vim'
" awesome status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" language plugins
" fish shell script
Plug 'dag/vim-fish'
" Apple Swift
Plug 'keith/swift.vim'
" less-css
Plug 'groenewege/vim-less'
" CoffeeScript
Plug 'kchmck/vim-coffee-script'
" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" handling parens
Plug 'tpope/vim-surround'
" zen-coding html expansion
Plug 'mattn/emmet-vim'
" linting
" Plug 'scrooloose/syntastic.git'
" comments
" Plug 'scrooloose/nerdcommenter'
" snippets
" dependencies for snipmate:
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" handy snippet plugin
" Plug 'garbas/vim-snipmate'
" stock snippets for the handy snippet plugin
" Plug 'honza/vim-snippets'

call plug#end()

" color scheme
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
" turn on fancy tab bar
let g:airline#extensions#tabline#enabled = 1

" Strip trailing whitespace from all lines when saving
autocmd BufWritePre * :%s/\s\+$//e
