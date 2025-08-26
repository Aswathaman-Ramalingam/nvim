-- html
return function(lspconfig, capabilities, on_attach)
    lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'html', 'htmldjango', 'django-html',
        settings = {
            html = {
                format = {
                    templating = true,
                    wrapLineLength = 120,
                    wrapAttributes = 'auto',
                    unformatted = '',
                    contentUnformatted = 'pre,code,textarea',
                    indentInnerHtml = true,
                    preserveNewLines = true,
                    maxPreserveNewLines = 2,
                    indentHandlebars = true,
                    endWithNewline = true,
                    extraLiners = 'head, body, /html',
                },
                hover = { documentation = true, references = true },
            },
        },
    })
end
