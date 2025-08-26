-- rust_analyzer
return function(lspconfig, capabilities, on_attach)
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'rust' },
        settings = {
            ['rust-analyzer'] = {
                diagnostics = { enable = true },
                checkOnSave = { enable = false },
                inlayHints = { enable = false },
                lens = { enable = false },
                procMacro = { enable = false },
                cargo = { buildScripts = { enable = false }, loadOutDirsFromCheck = false },
                rustc = { source = 'discover' },
                files = { excludeDirs = { '.git', 'target', 'node_modules' } },
                completion = { postfix = { enable = false }, privateEditable = { enable = false } },
                cachePriming = { enable = false },
                workspace = { symbol = { search = { scope = 'workspace_and_dependencies', limit = 128 } } },
            },
        },
    })
end
