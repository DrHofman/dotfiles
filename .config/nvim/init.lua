-- ============================================================================
-- Nvim init file
-- ============================================================================

vim.g.mapleader = " "
vim.g.filetype = "on"

-- ============================================================================
-- Core settings
-- ============================================================================
vim.opt.title = true
vim.opt.syntax.on = true
vim.opt.backspace = [[indent,eol,start]]
vim.opt.termguicolors = true
vim.opt.number = true                                               -- Set numbers display
vim.opt.autoread = true                                             -- reload file on external change
vim.opt.laststatus = 2                                              -- always show a status line
vim.opt.showcmd = true                                              -- Show incomplete cmds down the bottom
vim.opt.gdefault = true                                             -- Set global flag for search and replace
vim.opt.splitbelow = true                                           -- More natural splitting
vim.opt.splitright = true                                           -- More natural splitting
vim.opt.wrap = true                                                 -- Enable word wrap
vim.opt.linebreak = true                                            -- Wrap lines at convenient points
-- vim.opt.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]  -- Set trails for tabs and spaces
vim.opt.list = true                                                 -- Enable listchars
vim.opt.pumheight = 15                                              -- Maximum number of entries in autocomplete popup
vim.opt.tagcase = "smart"                                           -- Use smarcase for tags
vim.opt.shortmess:append("c")
vim.opt.binary = true                                               -- Write files as they are, don't mess with line endings etc.
vim.opt.completeopt:append("preview")                               -- Disable the completion preview window.
vim.opt.sessionoptions = "blank,curdir,folds,help,tabpages,winsize" -- Make session files minimal
vim.opt.clipboard:append("unnamedplus")                             -- Use the system clipboard
vim.opt.virtualedit = "block"

-- ================ Memory, CPU ================
vim.opt.hidden = true     -- Enable background buffers
vim.opt.history = 100     -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 300   -- Max column for syntax highlight
vim.opt.updatetime = 200  -- ms to wait for trigger an event

-- ================ Folding ======================
vim.opt.foldnestmax = 4
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "1"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- ================ Highlighting ======================
vim.opt.hlsearch = true   -- Highlight searches.
vim.opt.cursorline = true -- Highlight the current line.

-- ================ Indentation ======================
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.colorcolumn = "80"

-- ================ Mouse setup ======================
if vim.fn.has('mouse') then
  vim.opt.mouse = "a"          -- enable mouse in several mode
  vim.opt.mousemodel = "popup" -- set the behaviour of mouse
end

-- ================ File browser ======================
vim.g.netrw_hide = 0
vim.g.netrw_liststyle = 0
vim.opt.ttyfast = true
vim.opt.lazyredraw = true -- Stops macros rendering every step.

-- ================ Scrolling ========================
vim.opt.scrolloff = 8 -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5

-- ================ Search ========================
-- Make search case insensitive, but become sensitive if an upper case character is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ================ Spell checking ========================
vim.opt.spelllang = "en_gb"
vim.opt.spellfile = vim.fn.expand("$HOME/.nvim/spell/en.utf-8.add")
vim.opt.spell = true

-- ================ Enable persistent undo ========================
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.nvim/undo")
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- ================ wildignore ========================
vim.opt.wildmode = "list:full"
vim.opt.wildignore:append("*.o,*.obj,*~") -- stuff to ignore when tab completing
vim.opt.wildignore:append("*.git*")
vim.opt.wildignore:append("*.meteor*")
vim.opt.wildignore:append("*vim/backups*")
vim.opt.wildignore:append("*sass-cache*")
vim.opt.wildignore:append("*cache*")
vim.opt.wildignore:append("*logs*")
vim.opt.wildignore:append("*node_modules/**")
vim.opt.wildignore:append("*vendor/**")
vim.opt.wildignore:append("*DS_Store*")
vim.opt.wildignore:append("*.gem")
vim.opt.wildignore:append("log/**")
vim.opt.wildignore:append("tmp/**")
vim.opt.wildignore:append("*.png,*.jpg,*.gif")

vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetsDir = "~/.nvim/UltiSnips"

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*" },
--   command = "lua vim.lsp.buf.format()",
-- })

-- Remaps
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Replace word under cursor in file
keymap('n', '<Leader>s', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true })

keymap('i', 'jk', '<esc>', { noremap = true })
keymap('n', '<leader>fw', ':write<cr>', { noremap = true })
keymap('n', '<leader>pwd', ':echo @%<cr>', { noremap = true })
keymap('n', '<leader>nh', ':noh<cr>', { noremap = true })

-- Switch the motion keys so they will better fit the Colemak keyboard layout
-- Map line down to shift replace jump section
keymap('n', '}', 'j', { noremap = true })
keymap('n', '{', 'k', { noremap = true })

-- Jump one section with motion keys
keymap('n', 'k', '}', { noremap = true })
keymap('n', 'h', '{', { noremap = true })

-- Uses motion keys to switch tabs
keymap('n', 'j', 'gT', { noremap = true })
keymap('n', 'l', 'gt', { noremap = true })

-- Better split navigation
keymap('n', '<C-K>', '<C-W><C-J>', { noremap = true })
keymap('n', '<C-H>', '<C-W><C-K>', { noremap = true })
keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
keymap('n', '<C-J>', '<C-W><C-H>', { noremap = true })
keymap('n', ';', '<C-W><C-W>', { noremap = true })

-- Close buffer/file
keymap('n', '<Leader>q', ':q<cr>', { noremap = true })
keymap('n', 'Q', ':qa!<cr>', { noremap = true })

-- Clear search results
keymap('n', '<F3>', ':nohlsearch<CR><C-L>', { noremap = true })

-- 'tpope/vim-fugitive'
keymap('n', '<leader>g', '<C-u>Git<CR>', opts)
keymap('n', '<leader>gc', '<C-u>Gcommit<CR>', opts)
keymap('n', '<leader>gb', '<C-u>Git blame<CR>', opts)
keymap('n', '<leader>gj', '<C-u>Git pull<CR>', opts)
keymap('n', '<leader>gk', '<C-u>Git push<CR>', opts)
keymap('n', '<leader>gf', '<C-u>Git fetch<CR>', opts)

-- projectionist remap
keymap('n', '<leader>av', ':AV<CR>', opts)

-- save file
vim.keymap.set('n', '<Esc><Esc>', function()
  vim.lsp.buf.format()
  vim.cmd("write")
end)

-- Copy a file
vim.keymap.set('n', '<Leader>c', function()
  vim.cmd("clear")
  vim.cmd("exec \"!cp '%:p' '%:p:h/%:t:r-copy.%:e'\"")
  vim.cmd("redraw")
  vim.cmd("echo 'Copied ' . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')")
end)

-- Corrects the spelling under the cursor with the first suggestion.
vim.keymap.set('n', '<Leader>z', function()
  vim.cmd("normal 1z=")
end)

--  Quick session bindings.
keymap('n', '<leader>st', ':mksession! .quicksave.vim<CR>:echo "Session saved."<CR>', opts)
keymap('n', '<leader>sr', ':source .quicksave.vim<CR>:echo "Session loaded."<CR>', opts)

vim.keymap.set('n', '<leader>dU', function()
  vim.ui.select({ 'yes', 'no' }, { prompt = "Clear undo information?" }, function(choice)
    if choice == 'yes' then
      local old_undolevels = vim.o.undolevels
      vim.o.undolevels = -1
      vim.cmd("exec 'normal a \\<Bs>\\<Esc>'")
      vim.o.undolevels = old_undolevels
      vim.cmd("echo 'done.'")
    end
  end)
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  { "folke/neoconf.nvim",      cmd = "Neoconf" },
  "folke/neodev.nvim",
  { "lewis6991/impatient.nvim" },
  { "nathom/filetype.nvim" },

  'tpope/vim-characterize',
  'tpope/vim-commentary',
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
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

  -- {
  --   -- Local plugin path
  --   dir = '~/projects/neovim-gpt-agents',
  --   config = function()
  --   end
  -- },

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
  'tpope/vim-ragtag',
  'tpope/vim-repeat',
  'tpope/vim-sensible',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tpope/vim-vinegar',
  'liuchengxu/graphviz.vim',

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  'gpanders/editorconfig.nvim', -- EditorConfig plugin for Vim

  {
    'nvim-lualine/lualine.nvim', -- A blazing fast Neovim statusline
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  { -- A super powerful autopair plugin for Neovim that supports multiple characters
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  { -- auto-save
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
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
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- PERF: no need to load the plugin, if we only need its queries for mini.ai
          local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
          local opts = require("lazy.core.plugin").values(plugin, "opts", false)
          local enabled = false
          if opts.textobjects then
            for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
              if opts.textobjects[mod] and opts.textobjects[mod].enable then
                enabled = true
                break
              end
            end
          end
          if not enabled then
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          end
        end,
      },
    },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
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
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,

  },

  { -- LSP
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
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
    },
    config = function()
      -- Learn the keybindings, see :help lsp-zero-keybindings
      -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.ensure_installed({
        'tsserver',
        'eslint',
        'lua_ls',
        'solargraph',
        'marksman',
        'dockerls',
        'bashls',
      })

      -- Fix Undefined global 'vim'
      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          },
        }
      })

      -- lsp.configure('solargraph', {
      --     settings = {
      --         solargraph = {
      --           diagnostics = true,
      --           completion = true,
      --         }
      --     }
      -- })

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = 'E',
          warn = 'W',
          hint = 'H',
          info = 'I'
        }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        print('Language server attached')
        vim.o.formatoptions = "jcql"

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      -- Set up lspconfig
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig')['solargraph'].setup { capabilities = capabilities }
      require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
      require('lspconfig')['tsserver'].setup { capabilities = capabilities }
      require('lspconfig')['eslint'].setup { capabilities = capabilities }
      require('lspconfig')['marksman'].setup { capabilities = capabilities }
      require('lspconfig')['dockerls'].setup { capabilities = capabilities }
      require('lspconfig')['bashls'].setup { capabilities = capabilities }

      lsp.setup()
    end
  },

})
