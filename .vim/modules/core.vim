" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

set termguicolors

set number "Set numbers display
set relativenumber "Show numbers relative to current line
set autoread "reload file on external change

set showcmd "Show incomplete cmds down the bottom
set noshowmode "Hide showmode because of the powerline plugin
set gdefault "Set global flag for search and replace
set guicursor=a:blinkon500-blinkwait500-blinkoff500 "Set cursor blinking rate

" More natural splitting.
set splitbelow
set splitright

set wrap "Enable word wrap
set linebreak "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:· "Set trails for tabs and spaces
set list "Enable listchars


set pumheight=15 "Maximum number of entries in autocomplete popup
set tagcase=smart "Use smarcase for tags

" Use syntax highlighting only for 300 columns
set synmaxcol=300
set shortmess+=c

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
