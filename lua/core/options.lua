-- Core editor options and autocmds (minimal, concise)

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.signcolumn = 'no'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Tabs/indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.o.breakindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Lists
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Undo
vim.o.undofile = true

-- Inccommand
vim.o.inccommand = 'split'

-- Clipboard (async on start)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Kitty padding toggle
vim.cmd [[
  augroup kitty_padding
    autocmd!
    autocmd VimEnter,BufEnter * if !empty($KITTY_WINDOW_ID) | silent! execute '!kitty @ set-spacing padding=0' | endif
    autocmd VimLeave * if !empty($KITTY_WINDOW_ID) | silent! execute '!kitty @ set-spacing padding=default' | endif
  augroup END
]]

-- Yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
