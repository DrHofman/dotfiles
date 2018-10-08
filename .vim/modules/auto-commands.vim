" ================ Auto commands ====================== {{{

" augroup vimrc
"   autocmd!
"   autocmd QuickFixCmdPost [^l]* cwindow                                       "Open quickfix window after grepping
"   autocmd BufWritePre * call StripTrailingWhitespaces()                       "Auto-remove trailing spaces
"   autocmd InsertEnter * set nocul                                             "Remove cursorline highlight
"   autocmd InsertLeave * set cul                                               "Add cursorline highlight in normal mode
"   autocmd FocusGained,BufEnter * checktime                                    "Refresh file when vim gets focus
"   autocmd FileType dirvish call DirvishMappings()
"   autocmd BufWritePre,FileWritePre * call mkdir(expand('<afile>:p:h'), 'p')
"   autocmd BufEnter,BufWritePost,TextChanged,TextChangedI * call HighlightModified()
"   autocmd VimEnter * call deoplete#custom#option({ 'async_timeout': 10, 'camel_case': 1 })
"   autocmd VimEnter * call SetStatusline()
" augroup END

" augroup php
"   autocmd!
"   autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4
"   autocmd FileType php nmap <buffer><silent><Leader>if :call phpactor#UseAdd()<CR>
"   autocmd FileType php nmap <buffer><silent><Leader>ir :call phpactor#ContextMenu()<CR>
"   autocmd FileType php vmap <buffer><silent><Leader>ie :<C-U>call phpactor#ExtractMethod()<CR>
"   autocmd FileType php nmap <buffer><silent><C-]> :call phpactor#GotoDefinition()<CR>
" augroup END

" augroup javascript
"   autocmd!
"   autocmd FileType javascript nmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
"   autocmd FileType javascript xmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
"   autocmd FileType javascript nmap <buffer><silent><Leader>] <C-W>v<Plug>(JsGotoDefinition)
"   autocmd FileType javascript xmap <buffer><silent><Leader>] <C-W>vgv<Plug>(JsGotoDefinition)
" augroup END

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
"   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
" augroup END

" }}}
