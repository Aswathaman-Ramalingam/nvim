-- Completion & snippets

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
    },
    config = function()
      local lspkind = require 'lspkind'
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      require('luasnip.loaders.from_vscode').lazy_load()

      require('nvim-autopairs').setup()

      cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format {
            -- before = require('tailwind-tools.cmp').lspkind_format,
            mode = 'symbol_text',
            menu = {
              codeium = '',
              luasnip = '',
              buffer = '',
              path = '',
              nvim_lsp = '🅻',
            },
          },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
          { name = 'codeium' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
        },
      }
    end,
  },
}
