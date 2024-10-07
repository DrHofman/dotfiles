-- ============================================================================
-- Nvim init file
-- ============================================================================
vim.loader.enable()

vim.g.mapleader = " "
vim.g.filetype = "on"

-- ============================================================================
-- Core settings
-- ============================================================================
vim.opt.title = true
vim.opt.syntax.on = true
vim.opt.backspace = [[indent,eol,start]]
vim.opt.termguicolors = true
vim.opt.number = true -- Set numbers display
vim.opt.autoread = true -- reload file on external change
vim.opt.laststatus = 2 -- always show a status line
vim.opt.showcmd = true -- Show incomplete cmds down the bottom
vim.opt.gdefault = true -- Set global flag for search and replace
vim.opt.splitbelow = true -- More natural splitting
vim.opt.splitright = true -- More natural splitting
vim.opt.wrap = true -- Enable word wrap
vim.opt.linebreak = true -- Wrap lines at convenient points
-- vim.opt.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]  -- Set trails for tabs and spaces
vim.opt.list = true -- Enable listchars
vim.opt.pumheight = 15 -- Maximum number of entries in autocomplete popup
vim.opt.tagcase = "smart" -- Use smarcase for tags
vim.opt.shortmess:append("c")
vim.opt.binary = true -- Write files as they are, don't mess with line endings etc.
vim.opt.completeopt:append("preview") -- Disable the completion preview window.
vim.opt.sessionoptions = "blank,curdir,folds,help,tabpages,winsize" -- Make session files minimal
vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard
vim.opt.virtualedit = "block"

-- ================ Memory, CPU ================
vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 300 -- Max column for syntax highlight
vim.opt.updatetime = 200 -- ms to wait for trigger an event

-- ================ Folding ======================
vim.opt.foldnestmax = 4
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "1"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- ================ Highlighting ======================
vim.opt.hlsearch = true -- Highlight searches.
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
  vim.opt.mouse = "a" -- enable mouse in several mode
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
