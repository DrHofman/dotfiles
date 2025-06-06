return {

  -- [[ SYNTAX HIGHLIGHTING ]] ---------------------------------------------------------------
  -- [nvim-treesitter] - Syntax highlighting.
  -- see: `:h nvim-treesitter`
  -- link: https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    keys = {
      { '<c-space>', desc = 'Increment selection <C-SPC>' },
      { '<bs>', desc = 'Decrement selection <BS>', mode = 'x' },
    },
    init = function(plugin)
      require('lazy.core.loader').add_to_rtp(plugin)
      require 'nvim-treesitter.query_predicates'
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', 'LiadOz/nvim-dap-repl-highlights' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'css',
        'diff',
        'dockerfile',
        'dot',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'http',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'kotlin',
        'lua',
        'lua_patterns',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'properties',
        'python',
        'r',
        'regex',
        'ruby',
        'rust',
        'scss',
        'sql',
        'terraform',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['am'] = '@comment.outer',
            ['im'] = '@comment.inner',
            ['ib'] = { query = '@code_cell.inner', desc = 'in block' },
            ['ab'] = { query = '@code_cell.outer', desc = 'around block' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']B'] = { query = '@code_cell.inner', desc = 'next code block' },
          },
          goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[B'] = { query = '@code_cell.inner', desc = 'previous code block' },
          },
          goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<F2>'] = '@parameter.inner',
            ['<F4>'] = '@code_cell.outer',
          },
          swap_previous = {
            ['<F3>'] = '@parameter.inner',
            ['<F5>'] = '@code_cell.outer',
          },
        },
      },
    },
    config = function(_, opts)
      local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

      parser_configs.lua_patterns = {
        install_info = {
          url = 'https://github.com/OXY2DEV/tree-sitter-lua_patterns',
          files = { 'src/parser.c' },
          branch = 'main',
        },
      }
      if type(opts.ensure_installed) == 'table' then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
          ---@diagnostic disable-next-line: param-type-mismatch
        end, opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- [nvim-treesitter-textobjects] - Treesitter textobjects
  -- see: `:h nvim-treesitter-textobjects`
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'master',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    enabled = false,
    event = 'VeryLazy',
    config = function()
      -- When in diff mode, we want to use the default
      -- vim text objects c & C instead of the treesitter ones.
      local move = require 'nvim-treesitter.textobjects.move' ---@type table<string,fun(...)>
      local configs = require 'nvim-treesitter.configs'
      for name, fn in pairs(move) do
        if name:find 'goto' == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local config = configs.get_module('textobjects.move')[name] ---@type table<string,string>
              for key, query in pairs(config or {}) do
                if q == query and key:find '[%]%[][cC]' then
                  vim.cmd('normal! ' .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },

  -- [nvim-ts-autotags] - Automatically add closing tags for HTML and JSX
  -- see: `:h nvim-ts-autotags`
  -- link: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    'windwp/nvim-ts-autotag',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    opts = {},
  },
}
