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
                    'svelte',
                    'tailwindcss',
                    'ts_ls',
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

            -- Optional: Configure diagnostic settings globally
            vim.diagnostic.config({
                update_in_insert = false, -- Don't update diagnostics while typing
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
}
