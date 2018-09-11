let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.vim/bootstrap.vim

if filereadable("~/.vimrc_local")
  source ~/.vimrc_local
endif
