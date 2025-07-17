return {
    {
        'mason-org/mason-lspconfig.nvim',
        lazy = false,
        opts = {
            auto_install = true,
        },
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'htmx',
                    'jdtls',
                    'lua_ls',
                    'pyright',
                    'rust_analyzer',
                    'svelte',
                    'tailwindcss',
                    'ts_ls',
                    -- 'gopls',
                },
            }


            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufopts = { buffer = args.buf }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, bufopts)
                end,
            })
        end,
    },
    {
        'mason-org/mason.nvim',
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
    },
}
