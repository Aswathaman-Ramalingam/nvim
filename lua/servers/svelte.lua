-- svelte
return function(capabilities)
  vim.lsp.config('svelte', {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'svelte' },
    settings = { svelte = { plugin = { svelte = { defaultScriptLanguage = 'ts' } } } },
  })
end
