vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<Plug>(copilot-next)', { noremap = false })
vim.api.nvim_set_keymap('i', '<C-A>', '<Plug>(copilot-previous)', { noremap = false })
