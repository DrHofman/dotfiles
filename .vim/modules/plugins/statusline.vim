"" ================ Statusline ======================== {{{

"function! SetStatusline() abort
"  set statusline=%1*\ %{StatuslineMode()}                                       "Mode
"  set statusline+=\ %*%2*%{GitStatusline()}%*                                   "Git branch and status
"  set statusline+=\ %f                                                          "File path
"  set statusline+=\ %m                                                          "Modified indicator
"  set statusline+=\ %w                                                          "Preview indicator
"  set statusline+=\ %r                                                          "Read only indicator
"  set statusline+=\ %q                                                          "Quickfix list indicator
"  set statusline+=\ %=                                                          "Start right side layout
"  set statusline+=\ %{anzu#search_status()}                                     "Search status
"  set statusline+=\ %2*\ %{&ft}                                                 "Filetype
"  set statusline+=\ \│\ %p%%                                                    "Percentage
"  set statusline+=\ \│\ %c                                                      "Column number
"  set statusline+=\ \│\ %l/%L                                                   "Current line number/Total line numbers
"  set statusline+=\ %*%#Error#%{AleStatus('error')}%*                           "Errors count
"  set statusline+=%#DiffText#%{AleStatus('warning')}%*                          "Warning count
"endfunction

"hi User1 guifg=#504945 gui=bold
"hi User2 guibg=#665c54 guifg=#ebdbb2

"function! AleStatus(type) abort
"  let l:count = ale#statusline#Count(bufnr(''))
"  let l:errors = l:count.error + l:count.style_error
"  let l:warnings = l:count.warning + l:count.style_warning

"  if a:type ==? 'error' && l:errors
"    return printf(' %d E ', l:errors)
"  endif

"  if a:type ==? 'warning' && l:warnings
"    let l:space = l:errors ? ' ': ''
"    return printf('%s %d W ', l:space, l:warnings)
"  endif

"  return ''
"endfunction

"function! GitStatusline() abort
"  let l:head = fugitive#head()
"  if !exists('b:gitgutter')
"    return (empty(l:head) ? '' : printf(' %s ', l:head))
"  endif
"  let [l:added, l:modified, l:removed] = get(b:gitgutter, 'summary', [0, 0, 0])
"  let l:result = l:added == 0 ? '' : ' +'.l:added
"  let l:result .= l:modified == 0 ? '' : ' ~'.l:modified
"  let l:result .= l:removed == 0 ? '' : ' -'.l:removed
"  let l:result = join(filter([l:head, l:result], {-> !empty(v:val) }), '')
"  return (empty(l:result) ? '' : printf(' %s ', l:result))
"endfunction

"function! HighlightModified() abort
"  let l:is_modified = getwinvar(winnr(), '&mod') && getbufvar(bufnr(''), '&mod')

"  if empty(l:is_modified)
"    hi StatusLine guifg=#ebdbb2 guibg=#504945 gui=NONE
"    return ''
"  endif

"  hi StatusLine guifg=#ebdbb2 guibg=#fb4934 gui=NONE
"  return ''
"endfunction

"function! StatuslineMode() abort
"  let l:mode = mode()
"  call ModeHighlight(l:mode)
"  let l:modeMap = {
"  \ 'n'  : 'NORMAL',
"  \ 'i'  : 'INSERT',
"  \ 'R'  : 'REPLACE',
"  \ 'v'  : 'VISUAL',
"  \ 'V'  : 'V-LINE',
"  \ 'c'  : 'COMMAND',
"  \ '' : 'V-BLOCK',
"  \ 's'  : 'SELECT',
"  \ 'S'  : 'S-LINE',
"  \ '' : 'S-BLOCK',
"  \ 't'  : 'TERMINAL',
"  \ }

"  return get(l:modeMap, l:mode, 'UNKNOWN')
"endfunction

"function! ModeHighlight(mode) abort
"  if a:mode ==? 'i'
"    hi User1 guibg=#83a598
"  elseif a:mode =~? '\(v\|V\|\)'
"    hi User1 guibg=#fe8019
"  elseif a:mode ==? 'R'
"    hi User1 guibg=#8ec07c
"  else
"    hi User1 guibg=#928374
"  endif
"endfunction

""}}}
