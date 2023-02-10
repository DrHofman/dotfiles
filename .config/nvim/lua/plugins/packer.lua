local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- poacker can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'ellisonleao/gruvbox.nvim' }
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])

  use 'SirVer/ultisnips' -- UltiSnips is the ultimate solution for snippets in Vim
  use 'alunny/pegjs-vim' -- Syntax highlighting for PEGjs files in VIM - https://pegjs.org
  use 'github/copilot.vim'
  use 'hashivim/vim-hashicorp-tools'
  use 'hashivim/vim-terraform'
  use 'honza/vim-snippets' -- contains snippets files for various programming languages
  use 'jbyuki/venn.nvim' -- Draw ASCII diagrams in Neovim
  use 'junegunn/gv.vim' -- A git commit browser.
  use 'liuchengxu/graphviz.vim' -- Vim plugin for Graphviz dot
  use 'mbbill/undotree' -- The ultimate undo history visualizer for VIM
  use 'mhinz/vim-signify' -- Show a diff using Vim its sign column
  use 'morhetz/gruvbox' -- Colour scheme
  use 'rust-lang/rust.vim'
  use 'tpope/vim-characterize'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'sheerun/vim-polyglot' -- A collection of language packs for Vim
  use 'elzr/vim-json' -- Better JSON for VIM

  use {
    'nvim-lualine/lualine.nvim', -- A blazing fast Neovim statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Dart/Flutter
  use 'dart-lang/dart-vim-plugin'
  use 'thosakwe/vim-flutter'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'

  -- Graphql setup
  use 'jparise/vim-graphql'


  -- A super powerful autopair plugin for Neovim that supports multiple characters
  use {
    'codota/tabnine-nvim',
    run = "./dl_binaries.sh",
    config = function() require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 300,
        suggestion_color = { gui = "#808080", cterm = 244 },
        execlude_filetypes = { "TelescopePrompt" }
      })
    end
  }

  -- A super powerful autopair plugin for Neovim that supports multiple characters
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- auto-save
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })

  use('gpanders/editorconfig.nvim') -- EditorConfig plugin for Vim

  use('nathanaelkane/vim-indent-guides')
  vim.g.indent_guides_enable_on_vim_startup = 1
  vim.g.indent_guides_auto_colors = 0

  -- Fuzzy Search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
