-- Main LSP configuration
-- This file handles common LSP setup and imports individual server configs

return {
    -- Mason for LSP installation and management
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup()
        end,
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
    },
    -- Mason LSP config for automatic server setup
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            local lspconfig = require('lspconfig')

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
            if ok_cmp then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            local function on_attach(client, bufnr)
                local bufopts = { buffer = bufnr }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
            end

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',        -- Lua
                    'pyright',       -- Python
                    'rust_analyzer', -- Rust
                    'ts_ls',         -- TypeScript/JavaScript
                    'html',          -- HTML
                    'cssls',         -- CSS
                    'tailwindcss',   -- Tailwind CSS
                    'svelte',        -- Svelte
                    'htmx',          -- HTMX
                    'jdtls',         -- Java
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local ok, server_mod = pcall(require, 'plugins.lsp.servers.' .. server_name)
                        if ok and type(server_mod) == 'function' then
                            server_mod(lspconfig, capabilities, on_attach)
                        else
                            lspconfig[server_name].setup({ capabilities = capabilities, on_attach = on_attach })
                        end
                    end,
                },
            })

            vim.diagnostic.config({
                update_in_insert = false,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
                virtual_text = {
                    prefix = '●',
                    spacing = 0,
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '●',
                        [vim.diagnostic.severity.WARN] = '●',
                        [vim.diagnostic.severity.INFO] = '●',
                        [vim.diagnostic.severity.HINT] = '●',
                    },
                    texthl = {
                        [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                        [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                        [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                        [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                    },
                },
            })
        end,
    },

    -- LSP config plugin
    { 'neovim/nvim-lspconfig',           lazy = false },

    -- Import additional LSP-related plugins
    { import = 'plugins.lsp.completions' },
    { import = 'plugins.lsp.wildcat' },
}
