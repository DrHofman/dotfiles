" Enable less formating .less files
let b:ale_linters = {'less': ['prettier']}
let b:ale_fixers = {'less': ['prettier', 'remove_trailing_lines', 'trim_whitespace']}
