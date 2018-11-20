let g:ale_linters = {
\   'javascript': ['standard'],
\   'yaml': ['prettier'],
\   'less': ['prettier'],
\   'json': ['prettier'],
\   'php': ['php']
\}

let g:ale_fixers = {
\   'javascript': ['standard'],
\   'yaml': ['prettier'],
\   'less': ['prettier'],
\   'json': ['prettier'],
\   'php': ['phpcbf']
\}

let g:ale_php_phpcbf_standard = 'PSR2'

let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 0
