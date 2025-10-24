-- pyright
return function(capabilities)
  vim.lsp.config('pyright', {
    capabilities = capabilities,
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
