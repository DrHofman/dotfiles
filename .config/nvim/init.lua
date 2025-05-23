require('globals.options')
require('globals.remaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Close all hidden buffers
function Wipeout()
  local allBuffers = {}
  local winBuffers = {}

  local currentTab = vim.fn.tabpagenr()
  local buflist = vim.api.nvim_list_bufs()
  local num_tabs = vim.fn.tabpagenr('$') -- retrieve number of tab pages

  for _, buf in ipairs(buflist) do
    allBuffers[buf] = true
  end

  for i = 1, num_tabs do
    local tab_bufs = vim.fn.tabpagebuflist(i)

    for _, buf in ipairs(tab_bufs) do
      table.insert(winBuffers, buf)
    end
  end

  for _, buf in ipairs(winBuffers) do
    allBuffers[buf] = nil
  end

  -- If there are buffers left, delete them
  local buffersToClose = vim.tbl_keys(allBuffers)

  if #buffersToClose > 0 then
    vim.cmd('bwipeout ' .. table.concat(buffersToClose, ' '))
    vim.cmd('echo ' .. table.concat(buffersToClose, ' '))
  end

  -- Go back to the original tab page
  vim.cmd('tabNext ' .. currentTab)
end

-- Register the function so it can be called using :call Wipeout()
vim.api.nvim_create_user_command('Wipeout', Wipeout, {})

-- Map <leader>pa in normal mode to run PHPStan and set quickfix list
vim.api.nvim_set_keymap(
  'n',                       -- normal mode
  '<leader>paa',             -- key combination
  [[:lua RunPHPStan()<CR>]], -- Lua function
  { noremap = true, silent = true }
)

-- Define the Lua function
function RunPHPStan()
  -- Execute the system command
  local output = vim.fn.system(
    'vendor/bin/phpstan analyse src/Rizk --no-progress --error-format=raw --memory-limit 512M')

  -- Set the output to the quickfix list
  vim.fn.setqflist({}, ' ', { title = 'PHPStan', lines = vim.split(output, '\n') })

  -- Open the quickfix list
  vim.cmd('copen')
end

require("lazy").setup({
  spec = {
    { import = "plugins" },

    -- add plugins
    {
      'tpope/vim-fugitive',
      config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
      end
    },

    {
      'nvimdev/hlsearch.nvim',
      event = 'BufRead',
      config = function()
        require('hlsearch').setup()
      end
    },

    {
      'github/copilot.vim',
      config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.api.nvim_set_keymap('i', '<C-S>', '<Plug>(copilot-next)', { noremap = false })
        vim.api.nvim_set_keymap('i', '<C-A>', '<Plug>(copilot-previous)', { noremap = false })
      end
    },

    { -- The ultimate undo history visualizer for VIM
      'mbbill/undotree',
      config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_SplitWidth = 35
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_TreeNodeShape = '◉'
        vim.g.undotree_DiffAutoOpen = 0
      end
    },

    'tpope/vim-obsession',
    'tpope/vim-projectionist',
    'tpope/vim-repeat',
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'tpope/vim-vinegar',

    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup({
          on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
              if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
              else
                gitsigns.nav_hunk('next')
              end
            end)

            map('n', '[c', function()
              if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
              else
                gitsigns.nav_hunk('prev')
              end
            end)

            -- Actions
            map('n', '<leader>hs', gitsigns.stage_hunk)
            map('n', '<leader>hr', gitsigns.reset_hunk)
            map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            map('n', '<leader>hS', gitsigns.stage_buffer)
            map('n', '<leader>hu', gitsigns.undo_stage_hunk)
            map('n', '<leader>hR', gitsigns.reset_buffer)
            map('n', '<leader>hp', gitsigns.preview_hunk)
            map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
            map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
            map('n', '<leader>hd', gitsigns.diffthis)
            map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
            map('n', '<leader>td', gitsigns.toggle_deleted)

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        })
      end,
    },

    { -- A blazing fast Neovim statusline
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('lualine').setup()
      end
    },

    { -- theme and colorscheme
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight-night")
      end,
    },

    { -- Markdown preview plugin
      'toppair/peek.nvim',
      build = 'deno task --quiet build:fast',
      config = function()
        -- Markdown preview
        vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
        vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
      end,
    },

    {
      'nathanaelkane/vim-indent-guides',
      lazy = false,
      config = function()
        vim.g.indent_guides_enable_on_vim_startup = 1
        vim.g.indent_guides_auto_colors = 0
      end
    },

    { -- Fuzzy Search
      'nvim-telescope/telescope.nvim',
      dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
      },
      config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup {
          pickers = {
            find_files = {
              hidden = true,                                     -- Enable showing hidden files
              file_ignore_patterns = { "%.git/", "%.DS_Store" }, -- Ignore files
            },
          },
          extensions = {
            live_grep_args = {
              auto_quoting = true, -- enable/disable auto-quoting
              mappings = {         -- extend mappings
                i = {
                  ["<C-k>"] = lga_actions.quote_prompt(),
                  ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob /** " }),
                  -- freeze the current list and start a fuzzy search in the frozen list
                  ["<C-space>"] = lga_actions.to_fuzzy_refine,
                },
              },
              -- ... also accepts theme settings, for example:
              -- theme = "dropdown", -- use dropdown theme
              -- theme = { }, -- use own theme spec
              -- layout_config = { mirror=true }, -- mirror preview pane
            }
          }
        }

        -- then load the extension
        telescope.load_extension("live_grep_args")

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end
    },

    "nvim-treesitter/nvim-treesitter-textobjects",

    {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      cmd = { "TSUpdateSync" },
      keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Decrement selection", mode = "x" },
      },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "bash",
            "c",
            "html",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "php",
            "vim",
            "vimdoc",
            "yaml",
          },
          highlight = { enable = true },
          indent = { enable = true },
          --     incremental_selection = {
          --       enable = true,
          --       keymaps = {
          --         init_selection = "<C-space>",
          --         node_incremental = "<C-space>",
          --         scope_incremental = false,
          --         node_decremental = "<bs>",
          --       },
          --     },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
          textobjects = {
            select = {
              enable = true,

              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,

              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
              },
            },
          },
        })
      end
    },
  },

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  checker = {
    enabled = false, -- check for plugin updates periodically
    notify = false,  -- notify on update
  },                 -- automatically check for plugin updates

  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

})
