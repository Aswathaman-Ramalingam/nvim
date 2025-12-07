local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'servers.lua_ls'(capabilities)
require 'servers.pyright'(capabilities)
require 'servers.gopls'(capabilities)
require 'servers.ts_ls'(capabilities)
require 'servers.bashls'(capabilities)
require 'servers.tailwindcss'(capabilities)
require 'servers.rust_analyzer'(capabilities)
require 'servers.svelte'(capabilities)
require 'servers.jdtls'(capabilities)

vim.lsp.enable {
  'lua_ls',
  'pyright',
  'gopls',
  'ts_ls',
  'bashls',
  'tailwindcss',
  'rust_analyzer',
  'jdtls',
  'svelte',
}
