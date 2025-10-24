local on_attach = require('utils.lsp').on_attach
local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'servers.lua_ls'(capabilities)
require 'servers.pyright'(capabilities)
require 'servers.gopls'(capabilities)
require 'servers.ts_ls'(capabilities)
require 'servers.bashls'(capabilities)
require 'servers.tailwindcss'(capabilities)
