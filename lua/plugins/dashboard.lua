-- Dashboard

local custom_header = {
  '',
  '',
  '',
  '',
  '                                    ██████                                    ',
  '                                ████▒▒▒▒▒▒████                                ',
  '                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ',
  '                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ',
  '                          ██▒▒▒▒▒▒▒    ▒▒▒▒▒▒    ▒▒                           ',
  '                          ██▒▒▒▒▒  ▒▒▓▓▒▒▒▒  ▒▒▓▓▒▒▒                          ',
  '                          ██▒▒▒▒▒  ▒▒▓▓▒▒▒▒  ▒▒▓▓▒▒▒                          ',
  '                        ██▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒    ▒▒▒▒▒                        ',
  '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
  '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
  '                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
  '                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ',
  '                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ',
  '                        ██      ██      ████      ████                        ',
  '',
  '',
  '',
  '',
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = custom_header,
        center = {
          { icon = '  ', desc = 'New file', action = 'enew' },
          {
            icon = '  ',
            desc = 'Find file',
            key = 'f',
            action = function()
              require('fzf-lua').files()
            end,
          },
          {
            icon = '  ',
            desc = 'Recent files',
            key = 'r',
            action = function()
              require('fzf-lua').oldfiles()
            end,
          },
          {
            icon = ' ',
            desc = ' Config',
            key = 'c',
            action = function()
              require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
            end,
          },
          { icon = '󰒲  ', desc = 'Lazy', key = 'l', action = 'Lazy' },
          { icon = '  ', desc = 'Quit', key = 'q', action = 'quit' },
        },
      },
    }
  end,
}
