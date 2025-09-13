-- cssls
return function(lspconfig, capabilities, on_attach)
  lspconfig.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'css', 'scss', 'less' },
    settings = {
      css = {
        validate = true,
        lint = { unknownAtRules = 'ignore' },
        format = {
          newlineBetweenSelectors = true,
          newlineBetweenRules = true,
          spaceAroundSelectorSeparator = true,
        },
      },
      less = { validate = true, lint = { unknownAtRules = 'ignore' } },
      scss = { validate = true, lint = { unknownAtRules = 'ignore' } },
    },
  }
end
