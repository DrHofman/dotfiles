" Neovim config file

" Set the local leader.
" Map the leader key to SPACE
let mapleader="\<SPACE>"
nnoremap ; :

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
noremap k j
noremap h k

" Uses motion keys to switch tabs
noremap j gT
noremap l gt

" Better split navigation
nnoremap <C-K> <C-W><C-J>
nnoremap <C-H> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>

" Pull from either side of a git conflict.
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gl :diffget LOCAL<CR>
nnoremap <silent> <leader>gr :diffget REMOTE<CR>

" Print out the current mappings.
function! s:show_mappings()
  let path = Dot('mappings.sh')
  exec '!' . path
endfunction

nnoremap <silent> <leader><leader> :call <SID>show_mappings()<CR>
nnoremap <silent> <leader>ff :ALEFix<CR>
nnoremap <silent> <leader>cf :ALELint<CR>
nnoremap <silent> <leader>av :AV<CR>
nnoremap <silent> <leader>q :q<CR>

" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Quick session bindings.
nnoremap <silent> <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <silent> <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>

" ternDef
nnoremap <silent> ss :TernDef<CR>

" ternDefTab
nnoremap <silent> st :TernDefTab<CR>

" Ctrl-p remap
nnoremap <silent> pp :CtrlP<CR>
nnoremap <silent> pt :CtrlPTag<CR>

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
