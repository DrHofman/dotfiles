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
keymap('n', 'k', 'j', { noremap = true })
keymap('v', 'k', 'j', { noremap = true })
keymap('n', 'h', 'k', { noremap = true })
keymap('v', 'h', 'k', { noremap = true })

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

-- Disable arrow keys
for _, mode in pairs({ 'n', 'v', 'x' }) do
  for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set(mode, key, '<nop>')
  end
end

-- CodeCompanion keymaps
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
