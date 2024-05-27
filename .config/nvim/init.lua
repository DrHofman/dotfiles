-- ============================================================================
-- Nvim init file
-- ============================================================================
vim.g.mapleader = " "
vim.g.filetype = "on"

-- ============================================================================
-- Core settings
-- ============================================================================
vim.opt.title = true
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
vim.opt.list = true                                                 -- Enable listchars
vim.opt.pumheight = 15                                              -- Maximum number of entries in autocomplete popup
vim.opt.tagcase = "smart"                                           -- Use smarcase for tags
vim.opt.shortmess:append("c")
vim.opt.sessionoptions = "blank,curdir,folds,help,tabpages,winsize" -- Make session files minimal
vim.opt.clipboard:append("unnamedplus")                             -- Use the system clipboard

-- ================ Memory, CPU ================
vim.opt.hidden = true     -- Enable background buffers
vim.opt.history = 100     -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 300   -- Max column for syntax highlight
vim.opt.updatetime = 200  -- ms to wait for trigger an event
vim.wo.signcolumn = 'yes'
vim.loader.enable()       -- Use nvim 0.9+ new loader with byte-compilation cache

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

-- ================ Scrolling ========================
vim.opt.scrolloff = 8 -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5

-- ================ Search ========================
-- Make search case insensitive, but become sensitive if an upper case character is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

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

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remaps
local keymap = vim.api.nvim_set_keymap

local local_opts = { noremap = true, silent = true }

keymap('n', '<leader>pa', ':cexpr system(\'vendor/bin/phpstan analyse --no-progress --error-format=raw\')<cr>',
  { noremap = true })

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
keymap('n', '<leader>g', '<C-u>Git<CR>', local_opts)
keymap('n', '<leader>gc', '<C-u>Gcommit<CR>', local_opts)
keymap('n', '<leader>gb', '<C-u>Git blame<CR>', local_opts)
keymap('n', '<leader>gj', '<C-u>Git pull<CR>', local_opts)
keymap('n', '<leader>gk', '<C-u>Git push<CR>', local_opts)
keymap('n', '<leader>gf', '<C-u>Git fetch<CR>', local_opts)

-- projectionist remap
keymap('n', '<leader>av', ':AV<CR>', local_opts)

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
keymap('n', '<leader>st', ':mksession! .quicksave.vim<CR>:echo "Session saved."<CR>', local_opts)
keymap('n', '<leader>sr', ':source .quicksave.vim<CR>:echo "Session loaded."<CR>', local_opts)

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


require("lazy").setup({
  { -- displays a popup with possible key bindings
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  { -- Supercharge your Rust experience
    'mrcjkb/rustaceanvim',
    version = '^3',
    ft = { 'rust' },
  },

  { -- Neovim setup for init.lua and plugin development
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup({})
    end
  },

  { -- Smart and Powerful commenting
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  'tpope/vim-characterize',
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

  {
    dir = "~/projects/common/gp.nvim",
    config = function()
      require("gp").setup({
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        agents = {
          {
            name = "ChatGPT4o",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = "You are a general AI assistant.\n\n"
                .. "The user provided the additional info about how they would like you to respond:\n\n"
                .. "- If you're unsure don't guess and say you don't know instead.\n"
                .. "- Ask question if you need clarification to provide better answer.\n"
                .. "- Think deeply and carefully from first principles step by step.\n"
                .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                .. "- Use Socratic method to improve your thinking and coding skills.\n"
                .. "- Don't elide any code from your output if the answer requires coding.\n"
                .. "- Take a deep breath; You've got this!\n",
          },
          {
            name = "JSCodeGPT4",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt =
                "You are to operate as a specialized AI for editing and generating JavaScript code. When interacting with users, adhere strictly to the following guidelines to ensure your responses align with specified coding standards and preferences:\n\n"
                ..
                "1. **Output Format**: Your responses should exclusively be in JavaScript code. Refrain from including semicolons at the end of lines to match the specified style.\n"
                ..
                "2. **Linting Rules**: Adhere to the provided `.jshintrc` configuration, emphasizing rules such as automatic semicolon insertion (`asi: true`), strict equality (`eqeqeq: true`), and others. Ensure your code is compatible with browser environments, Node.js, and follows ESNext standards.\n"
                ..
                "3. **Formatting Standards**: Follow the `.prettierrc` setup, which includes using single quotes for strings, omitting semicolons, employing a tab width of 2 spaces, and preferring trailing commas where applicable (ES5).\n"
                ..
                "4. **ESLint Configuration**: Your code must conform to the `.eslintrc` rules, focusing on ECMAScript latest version syntax, and adhering to best practices like using single quotes for strings, avoiding bitwise operators, enforcing curly braces, and others. The environment is set to support ES6, browser-specific globals, jQuery, and Node.js.\n"
                ..
                "5. **Library Usage**: Limit your dependencies to the specified libraries in the `dependencies` section. These include `config`, `cookie-parser`, `express`, `http-errors`, `ioredis`, `mysql2`, `node-fetch`, `php-serialization`, `php-unserialize`, `uuid`, and `yup`. Only incorporate additional libraries if necessary to implement new features.\n"
                ..
                "6. **Response Style**: Exclude any commentary outside of your JavaScript code snippets. This means providing concise, clear code examples without additional explanations or annotations outside the code itself.\n"
                ..
                "7. **Initiation and Conclusion**: Begin and conclude your responses with an empty line to clearly demarcate your code snippets.\n"
                ..
                "8. **Code Clarity**: Prioritize code clarity and readability in your responses. Use descriptive variable names, avoid overly complex logic, and ensure your code is well-structured and easy to understand.\n"
                ..
                "9. **Code Efficiency**: Optimize your code for performance and efficiency. Use built-in JavaScript methods where possible, avoid unnecessary loops, and ensure your code is concise and effective.\n"
                ..
                "10. **Error Handling**: Implement error handling where necessary to ensure your code is robust and resilient. Use try-catch blocks, error messages, and other techniques to manage exceptions and edge cases effectively.\n"
                ..
                "This setup is crafted to ensure your assistance as an AI code editor is efficient, focused, and adheres to the defined JavaScript coding conventions and standards. Your contributions should seamlessly integrate into development workflows, supporting both the technical and stylistic aspects of JavaScript programming.\n"
                .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
                .. "START AND END YOUR ANSWER WITH:\n\n```",
          },
        }
      })

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
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
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk)
          map('n', '<leader>hr', gs.reset_hunk)
          map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end,
  },

  -- Database
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("config.dadbod").setup()
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

  { -- gruvbox colorscheme
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

  { -- auto remove search highlight and rehighlight when using n or N
    "nvimdev/hlsearch.nvim",
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
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
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    end
  },

  { -- Treesitter configurations and abstraction layer
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        modules = {},
        -- A list of parser names
        ensure_installed = {
          "bash",
          "c",
          "css",
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
          "rust",
          "sql",
          "terraform",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },

        ignore_install = {},
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
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
              ['ii'] = '@conditional.inner',
              ['ai'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
              ['at'] = '@comment.outer',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,

          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  { -- DAP (Debug Adapter Protocol)
    'mfussenegger/nvim-dap'
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
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = {
          'tsserver',
          'eslint',
          'lua_ls',
          'solargraph',
          'intelephense',
          'marksman',
          'dockerls',
          'bashls',
        },
      })

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

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

      require('lspconfig')['intelephense'].setup { capabilities = capabilities }
      require('lspconfig')['solargraph'].setup { capabilities = capabilities }
      require('lspconfig')['lua_ls'].setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'KEYS', 'ARGV', 'redis' }
            }
          }
        } }
      require('lspconfig')['tsserver'].setup { capabilities = capabilities }
      require('lspconfig')['eslint'].setup { capabilities = capabilities }
      require('lspconfig')['marksman'].setup { capabilities = capabilities }
      require('lspconfig')['dockerls'].setup { capabilities = capabilities }
      require('lspconfig')['bashls'].setup { capabilities = capabilities }

      lsp.setup()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })
    end
  },

})
