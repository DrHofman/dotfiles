" Neovim config file

" Set the local leader.
" Map the leader key to SPACE
let mapleader="\<SPACE>"
nnoremap ; :

" Clears the search.
function! s:clear_search_results()
  let @/ = ""
endfunction

nnoremap <silent> <leader>/d :call <SID>clear_search_results()<CR>

:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Shows the amount of matches for the previous search.
function! s:count_search_results()
  %s///gn
endfunction

nnoremap <silent> <leader>/c :call <SID>count_search_results()<CR>

" Deletes the hidden buffers.
function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" Corrects the spelling under the cursor with the first suggestion.
function! s:correct_to_first_spelling_suggestion()
  normal 1z=
endfunction

nnoremap <silent> <leader>z :call <SID>correct_to_first_spelling_suggestion()<CR>

" save file
map <Esc><Esc> :w<CR>

" Trim the trailing white space from the file.
function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction

" Switch the motion keys so they will better fit the Colemak keyboard layout
noremap h k
noremap k j
noremap j h

nnoremap <silent> <up> <C-W><C-k>
nnoremap <silent> <down> <C-W><C-j>
nnoremap <silent> <left> <C-W><C-h>
nnoremap <silent> <right> <C-W><C-l>

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
nnoremap <silent> <leader>ff :Neoformat<CR>
nnoremap <silent> <leader>av :AV<CR>
nnoremap <silent> <leader>q :q<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction

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
