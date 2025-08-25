-- Core keymaps (minimal descriptions)

-- Clear search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

-- Disable arrow keys in normal, insert, and visual modes to encourage Vim motions
vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<Nop>', { desc = 'Disable Up Arrow' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<Nop>', { desc = 'Disable Down Arrow' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<Nop>', { desc = 'Disable Left Arrow' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<Nop>', { desc = 'Disable Right Arrow' })
