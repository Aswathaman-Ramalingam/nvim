return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format { async = true, lsp_format = 'fallback' }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = 'fallback',
                    }
                end
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'black' },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                svelte = { 'prettierd' },
                html = { 'prettierd' },
                rust = { 'rustfmt' },
                java = { 'google-java-format' },
            },
        },
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup() {
                autotag = {
                    enable = true,
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = true,
                    filetypes = {
                        'html',
                        'javascript',
                        'javascriptreact',
                        'typescript',
                        'typescriptreact',
                        'svelte',
                    },
                }
            }
        end,
        event = 'InsertEnter',
    },
}
