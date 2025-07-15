return {
  {
    'zbirenbaum/copilot.lua',
    enabled = true,
    cmd = 'Copilot',
    event = { 'InsertEnter' },
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          accept = false,
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = true,
        },
      }

      -- Enable <Tab> to indent if no suggestions are available
      -- vim.keymap.set('i', '<Tab>', function()
      --   if require('copilot.suggestion').is_visible() then
      --     require('copilot.suggestion').accept()
      --   else
      --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
      --   end
      -- end, { desc = 'Super Tab', silent = true })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
  },
}
