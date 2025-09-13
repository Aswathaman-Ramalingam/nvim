-- jdtls
return function(lspconfig, capabilities, on_attach)
  lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { 'jdtls' },
    filetypes = { 'java' },
    settings = {
      java = {
        format = { settings = { profile = 'GoogleStyle' } },
        saveActions = { organizeImports = true },
        codeGeneration = { useBlocks = true, generateComments = true },
        completion = {
          favoriteStaticMembers = {
            'org.junit.Assert.*',
            'org.junit.Assume.*',
            'org.junit.jupiter.api.Assertions.*',
            'org.junit.jupiter.api.Assumptions.*',
            'org.junit.jupiter.api.DynamicContainer.*',
            'org.junit.jupiter.api.DynamicTest.*',
            'org.mockito.Mockito.*',
            'org.mockito.ArgumentMatchers.*',
            'org.mockito.Answers.*',
          },
        },
        sources = { organizeImports = { starThreshold = 99, staticStarThreshold = 99 } },
        configuration = { runtimes = { { name = 'JavaSE-17', path = '~/.sdkman/candidates/java/17.0.2-open', default = true } } },
      },
    },
  }
end
