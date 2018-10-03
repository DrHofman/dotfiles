let g:ale_linters = {
\   'javascript': ['standard'],
\   'yaml': ['prettier'],
\   'less': ['prettier'],
\   'php': ['php']
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_fixers = {'yaml': ['prettier']}
let g:ale_fixers = {'less': ['prettier']}
let g:ale_fixers = {'json': ['prettier']}
let g:ale_fixers = {'php': ['phpcbf']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
