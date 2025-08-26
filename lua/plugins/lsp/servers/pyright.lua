-- pyright
return function(lspconfig, capabilities, on_attach)
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'python' },
        settings = {
            python = {
                analysis = {
                    autoImportCompletions = true,
                    typeCheckingMode = 'basic',
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'workspace',
                },
                pythonPath = 'python3',
            },
        },
    })
end
