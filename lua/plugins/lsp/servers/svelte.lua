-- svelte
return function(lspconfig, capabilities, on_attach)
  lspconfig.svelte.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'svelte' },
    settings = { svelte = { plugin = { svelte = { defaultScriptLanguage = 'ts' } } } },
  }
end
