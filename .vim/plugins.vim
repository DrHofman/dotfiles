" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

Plug 'w0rp/ale' "Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files
Plug 'Raimondi/delimitMate' "Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'SirVer/ultisnips' "UltiSnips - The ultimate snippet solution for Vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Dark powered asynchronous completion framework for neovim/Vim8
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'} "PHP completion, refactoring and introspection tool
Plug 'kristijanhusak/deoplete-phpactor' "Phpactor integration for deoplete.nvim
Plug 'mbbill/undotree' "The ultimate undo history visualizer for VIM
Plug 'airblade/vim-gitgutter' "A Vim plugin which shows a git diff in the gutter
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file, buffer, mru, tag, etc finder
Plug 'morhetz/gruvbox'
Plug 'editorconfig/editorconfig-vim' "EditorConfig plugin for Vim
Plug 'ervandew/supertab' "Perform all your vim insert mode completions with Tab
Plug 'gyim/vim-boxdraw' "An ASCII box drawing plugin for Vim
Plug 'haya14busa/incsearch.vim' "Improved incremental searching for Vim
Plug 'haya14busa/vim-asterisk' "asterisk.vim provides improved * motions
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'moll/vim-node'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'isRuslan/vim-es6'
Plug 'pearofducks/ansible-vim'
Plug 'raymond-w-ko/vim-niji'
Plug 'mileszs/ack.vim'
Plug 'alunny/pegjs-vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/applescript.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'mhinz/vim-nginx'
Plug 'lumiliet/vim-twig' "Twig syntax highlighting, snipMate, etc.
