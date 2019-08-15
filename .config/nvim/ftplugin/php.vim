" Enable terraform fmt only for .tf files
let b:ale_linters = {'php': ['php', 'phpcs']}
let b:ale_fixers = {'php': ['phpcbf', 'remove_trailing_lines', 'trim_whitespace']}
let b:ale_php_phpcbf_standard = 'PSR2'
let b:ale_php_phpcs_standard = 'PSR2'
setlocal shiftwidth=4
setlocal softtabstop=4
