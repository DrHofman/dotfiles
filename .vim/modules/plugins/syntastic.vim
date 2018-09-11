let g:syntastic_javascript_checkers=['jshint', 'jscs']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=0

let g:syntastic_html_tidy_exec = 'tidy'

let g:syntastic_html_tidy_ignore_errors=["is not recognized", "discarding unexpected"]

nnoremap vv :SyntasticCheck<CR>
