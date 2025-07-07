-- Dashboard
-- https://github.com/nvimdev/dashboard-nvim

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = { -- Custom header
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
        },
        center = {
          { icon = '  ', desc = 'New file', action = 'enew' },
          { icon = '  ', desc = 'Find file', key = '/', action = 'Telescope find_files' },
          { icon = '  ', desc = 'Recent files', key = 'r', action = 'Telescope oldfiles' },
          {
            icon = ' ',
            desc = ' Config',
            key = 'c',
            action = function()
              require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
            end,
          },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
          { icon = '  ', desc = 'Quit', key = 'q', action = 'quit' },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
