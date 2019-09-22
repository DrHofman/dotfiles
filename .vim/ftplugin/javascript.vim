" Enable terraform fmt only for .tf files
let b:ale_linters = {'javascript': ['standard']}
let b:ale_fixers = {'javascript': ['standard', 'remove_trailing_lines', 'trim_whitespace']}
setlocal shiftwidth=2
setlocal softtabstop=2
