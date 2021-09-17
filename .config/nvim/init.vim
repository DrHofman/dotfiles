" ============================================================================
" Nvim init file
" ============================================================================

let g:python3_host_prog = '/usr/local/bin/python3'

" Set the leader key to SPACE
let mapleader="\<SPACE>"

" ============================================================================
" Vim plugin list
" ============================================================================
call plug#begin(stdpath('data') . '/plugged')

Plug 'mbbill/undotree' "The ultimate undo history visualizer for VIM
Plug 'mhinz/vim-signify' "Show a diff using Vim its sign column
Plug 'morhetz/gruvbox'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'moll/vim-node'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'alunny/pegjs-vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-characterize'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/applescript.vim'
Plug 'mhinz/vim-nginx'
Plug 'lumiliet/vim-twig' "Twig syntax highlighting, snipMate, etc.
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-dadbod'
Plug 'liuchengxu/graphviz.vim'

Plug 'tpope/vim-commentary'
" autocmd FileType  setlocal commentstring=#\ %s

" Coc extensions
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Intellisense engine for vim8 & neovim

" Graphql setup
Plug 'jparise/vim-graphql'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files
let g:gutentags_exclude_project_root = [$HOME]

Plug 'haya14busa/incsearch.vim' "Improved incremental searching for Vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'tpope/vim-dispatch'
nnoremap <silent> <leader>npi :Dispatch npm install<CR>
nnoremap <silent> <leader>npd :Dispatch npm run dev<CR>
nnoremap <silent> <leader>npb :Dispatch npm run build<CR>

Plug 'mileszs/ack.vim'
nnoremap K :A! "\b<C-R><C-W>\b"<CR>:cw<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
nnoremap <silent> pp :CtrlP<CR>
nnoremap <silent> pt :CtrlPTag<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''tests'' --hidden -g ""'
endif

Plug 'editorconfig/editorconfig-vim' "EditorConfig plugin for Vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'liuchengxu/eleline.vim' "Another elegant statusline for vim
let g:eleline_powerline_fonts = 1

Plug 'SirVer/ultisnips' "UltiSnips - The ultimate snippet solution for Vim
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

Plug 'vim-vdebug/vdebug' " Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options.path_maps = {'/home/deploy/rizk':$HOME . '/projects/betsson/rizk'}

Plug 'haya14busa/vim-asterisk' "asterisk.vim provides improved * motions
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
nnoremap <silent> <leader>gk :<C-u>Gpush<CR>
nnoremap <silent> <leader>gf :<C-u>Gfetch<CR>

Plug 'nathanaelkane/vim-indent-guides'
nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

augroup indent_guide_settings
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
augroup END

Plug 'raymond-w-ko/vim-niji'
let g:niji_matching_filetypes = ['clojure', 'javascript']

Plug 'inside/vim-search-pulse'
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_disable_auto_mappings = 1
let g:vim_search_pulse_color_list = ["red", "white"]
let g:vim_search_pulse_duration = 200

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

call plug#end()

" ============================================================================
" Core settings
" ============================================================================
set title
set backspace=indent,eol,start
set termguicolors
set number "Set numbers display
set autoread "reload file on external change
set laststatus=2 "always show a status line
set showcmd "Show incomplete cmds down the bottom
set noshowmode "Hide showmode, we have a status line for that
set gdefault "Set global flag for search and replace
set splitbelow splitright "More natural splitting.
set wrap "Enable word wrap
set linebreak "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:· "Set trails for tabs and spaces
set list "Enable listchars
set pumheight=15 "Maximum number of entries in autocomplete popup
set tagcase=smart "Use smarcase for tags
set synmaxcol=300 "Use syntax highlighting only for 300 columns
set shortmess+=c
set binary "Write files as they are, don't mess with line endings etc.
set completeopt-=preview "Disable the completion preview window.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize "Make session files minimal
set clipboard+=unnamedplus "Use the system clipboard
set virtualedit=block

" Put swap files into a temp folder so that they are not scattered all over
if has("win32")
   set directory=c:\\tmp,c:\\temp
elseif has("unix")
   set directory=/tmp
endif


" ================ Theme ======================
syntax on
autocmd vimenter * colorscheme gruvbox
set background=dark

" ================ Folding ======================
set foldmethod=manual
set foldlevelstart=1

" ================ Highlighting ======================
set hlsearch "Highlight searches.
set cursorline "Highlight the current line.

" Make spelling problems easier to read.
function! s:after_colorscheme()
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END

" ================ Indentation ======================
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set colorcolumn=80

" ================ Mouse setup ======================
if has('mouse')
    set mouse=a  " enable mouse in several mode
    set mousemodel=popup  " set the behaviour of mouse
endif

" ================ File browser ======================
let g:netrw_hide = 0
let g:netrw_liststyle = 0

" ================ File browser ======================
set ttyfast
set lazyredraw " Stops macros rendering every step.

" ================ Scrolling ========================
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Search ========================
" Make search case insensitive, but become sensitive if an upper case character is used
set ignorecase
set smartcase

" ================ Spell checking ========================
set spelllang=en_gb
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell

" ================ Enable persistent undo ========================
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" ================ wildignore ========================
set wildmode=list:full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*vendor/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ============================================================================
" Mappings
" ============================================================================

" Copied myfile.txt to myfile-copy.txt
nnoremap <silent> <Leader>c :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied " . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')<cr>

" Replace word under cursor in file
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Shows the amount of matches for the previous search.
function! s:count_search_results()
  %s///gn
endfunction

nnoremap <silent> <leader>/c :call <SID>count_search_results()<CR>

" Clear search results
nnoremap <F3> :nohlsearch<CR><C-L>

" Corrects the spelling under the cursor with the first suggestion.
function! s:correct_to_first_spelling_suggestion()
  normal 1z=
endfunction

nnoremap <silent> <leader>z :call <SID>correct_to_first_spelling_suggestion()<CR>

" save file
map <Esc><Esc> :w<CR>

" Switch the motion keys so they will better fit the Colemak keyboard layout
" Map line down to shift replace jump section
noremap } j
noremap { k

" Jump one section with motion keys
noremap k }
noremap h {

" Uses motion keys to switch tabs
noremap j gT
noremap l gt

" Better split navigation
nnoremap <C-K> <C-W><C-J>
nnoremap <C-H> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>
nnoremap ; <C-W><C-W>

" Print out the current mappings.
function! s:show_mappings()
  exec '!~/mappings.sh'
endfunction

nnoremap <silent> <leader><leader> :call <SID>show_mappings()<CR>
nnoremap <silent> <leader>ff :CocFix<CR>
nnoremap <silent> <leader>av :AV<CR>

" Quit
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" bind K to grep word under cursor

" Quick session bindings.
nnoremap <silent> <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <silent> <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>

" ternDef
nnoremap <silent> ss :TernDef<CR>

" ternDefTab
nnoremap <silent> st :TernDefTab<CR>

" Ctrl-p remap

" :help clear-undo (Vim 7.3+)
function! ClearUndo()
    let choice = confirm("Clear undo information?", "&Yes\n&No", 2)
    if choice == 1
        let old_undolevels = &undolevels
        set undolevels=-1
        exe "normal a \<Bs>\<Esc>"
        let &undolevels = old_undolevels
        echo "done."
    endif
endfunction
map <leader>dU :call ClearUndo()<CR>

" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

