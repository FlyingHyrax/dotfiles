" save before running make
set autowrite
" run pandoc
set makeprg=pandoc\ -f\ markdown\ -t\ html5\ -o\ gen/%<.html\ %
" remap K to split lines instead of opening man page
nnoremap K i<CR><Esc>
