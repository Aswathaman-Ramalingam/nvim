-- htmx
return function(lspconfig, capabilities, on_attach)
    lspconfig.htmx.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'html', 'htmldjango', 'django-html', 'htmx' },
        settings = { htmx = {} },
    })
end
