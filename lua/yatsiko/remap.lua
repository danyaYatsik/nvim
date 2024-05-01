vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ':Neotree current<CR>')
vim.keymap.set('n', '<C-[>', vim.cmd.noh)
vim.keymap.set({ 'v', 'n' }, '<C-w>c', vim.cmd.close)
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')

vim.keymap.set('v', '<leader>p', '"_dp')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set({ 'n', 'v' }, '<leader>x', '"_x')

vim.keymap.set('n', '<C-w>y', WindowYank, { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>p', WindowPaste, { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>g', DefloatWindow, { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, 'gl', '$')
vim.keymap.set({ 'n', 'v' }, 'gh', '^')
