" save before running make
set autowrite
" run pandoc
set makeprg=pandoc\ -f\ markdown\ -t\ html5\ -o\ gen/%<.html\ %
