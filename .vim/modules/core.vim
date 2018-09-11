" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Set numbers display
set number
set relativenumber

set autoread

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
" let g:auto_save_silent = 1

" Enable invisible characters.
set list

" More natural splitting.
set splitbelow
set splitright

" Set a default indent, but vim-sleuth should adjust it.
set tabstop=4
set shiftwidth=4
set expandtab

" Put swap files into a temp folder so that they are not scattered all over
if has("win32")
   set directory=c:\\tmp,c:\\temp
elseif has("unix")
   set directory=/tmp
endif

" Write files as they are, don't mess with line endings etc.
set binary

" Disable the completion preview window.
set completeopt-=preview

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

let g:deoplete#enable_at_startup = 1
