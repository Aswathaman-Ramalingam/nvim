-- tailwindcss
return function(lspconfig, capabilities, on_attach)
    lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            tailwindCSS = {
                includeLanguages = {
                    html = 'html', javascript = 'javascript', css = 'css',
                    typescript = 'typescript', typescriptreact = 'typescriptreact',
                    javascriptreact = 'javascriptreact', vue = 'vue', svelte = 'svelte',
                },
                classAttributes = {
                    'class','className','ngClass','v-bind:class','v-bind:class.bind',
                    'v-bind:class:object','v-bind:class:array','v-bind:class:function',
                    'v-bind:class:expression','v-bind:class:object.expression',
                    'v-bind:class:array.expression','v-bind:class:function.expression',
                },
                lint = {
                    cssConflict = 'warning', invalidApply = 'error', invalidConfigPath = 'error',
                    invalidScreen = 'error', invalidTailwindDirective = 'error', invalidVariant = 'error',
                    recommendedVariantOrder = 'warning',
                },
                experimental = { classRegex = { 'cva\\(([^)]*)\\)', 'cx\\(([^)]*)\\)', 'cn\\(([^)]*)\\)' } },
            },
        },
    })
end
