-- Dashboard

local custom_header = {
    '', '', '', '',
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
    '', '', '', '',
}

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'doom',
            config = {
                header = custom_header,
                center = {
                    { icon = '  ', desc = 'New file', action = 'enew' },
                    { icon = '  ', desc = 'Find file', key = '/',
                        action = function()
                            require('telescope.builtin').find_files {
                                find_command = { 'fd', '--type', 'f', '--max-depth', '1' }
                            }
                        end
                    },
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

