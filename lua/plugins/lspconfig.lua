return {
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'htmx',
                'jdtls',
                'lua_ls',
                'pyright',
                'rust_analyzer',
                'svelte',
                'tailwindcss',
                'ts_ls',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        on_attach = function(_, bufnr)
                            local bufopts = { buffer = bufnr }
                            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                            vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, bufopts)
                        end,
                    }
                end,
            },
        },
    },
    {
        'mason-org/mason.nvim',
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
    },
}
