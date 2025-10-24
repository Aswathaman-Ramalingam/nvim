local M = {}

M.on_attach = function(client, bufnr)
  local keymap = vim.keymap.set
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  keymap('n', 'gr', vim.lsp.buf.references, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap('n', 'gt', vim.lsp.buf.type_definition, opts)
  keymap('n', '<leader>f', vim.lsp.buf.format, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'gs', function()
    vim.cmd 'vsplit'
    vim.lsp.buf.definition()
  end, opts)
  keymap('n', 'gra', vim.lsp.buf.code_action, opts)
  keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
  keymap('n', '<leader>D', function()
    vim.diagnostic.open_float { scope = 'line' }
  end, opts)
  keymap('n', '<leader>d', vim.diagnostic.open_float, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)

  -- Order Imports (if supported by the client LSP)
  if client.supports_method 'textDocument/codeAction' then
    keymap('n', '<leader>oi', function()
      vim.lsp.buf.code_action {
        context = {
          only = { 'source.organizeImports' },
          diagnostics = {},
        },
        apply = true,
        bufnr = bufnr,
      }
      vim.defer_fn(function()
        vim.lsp.buf.format { bufnr = bufnr }
      end, 50)
    end, opts)
  end
end

return M
