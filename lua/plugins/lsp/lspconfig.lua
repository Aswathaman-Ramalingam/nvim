-- LSP & Mason

return {
    {
        'mason-org/mason-lspconfig.nvim',
        lazy = false,
        opts = { auto_install = true },
        dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'htmx', 'jdtls', 'lua_ls', 'pyright', 'svelte', 'tailwindcss', 'ts_ls', 'rust_analyzer',
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup {}
                    end,
                    rust_analyzer = function()
                        require('lspconfig').rust_analyzer.setup {
                            settings = {
                                ['rust-analyzer'] = {
                                    diagnostics = { enable = true },
                                    checkOnSave = { enable = false },
                                    inlayHints = { enable = false },
                                    lens = { enable = false },
                                    procMacro = { enable = false },
                                    cargo = { buildScripts = { enable = false }, loadOutDirsFromCheck = false },
                                    rustc = { source = "discover" },
                                    files = { excludeDirs = { ".git", "target", "node_modules" } },
                                    completion = { postfix = { enable = false }, privateEditable = { enable = false } },
                                    cachePriming = { enable = false },
                                    workspace = { symbol = { search = { scope = "workspace_and_dependencies", limit = 128 } } },
                                },
                            },
                        }
                    end,
                }
            }
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufopts = { buffer = args.buf }
                    vim.keymap.set("n", "gk", vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, bufopts)
                end,
            })
            vim.diagnostic.config({
                update_in_insert = true,
                severity_sort = true,
                float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" },
            })
        end,
    },
    {
        'javiorfo/nvim-wildcat',
        lazy = true,
        cmd = { "WildcatBuild", "WildcatRun", "WildcatUp", "WildcatServer" },
        dependencies = { 'javiorfo/nvim-popcorn', 'javiorfo/nvim-spinetta' },
        build = function()
            require 'wildcat.build'.build()
        end,
        opts = {
            default_server = "tomcat",
            build_tool = "maven",
        }
    }
}
