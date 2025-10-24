-- rust_analyzer
return function(capabilities)
  vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
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
