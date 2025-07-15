-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    -- lazy.nvim
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
            config = function()
                require('notify').setup {
                    stages = 'fade_in_slide_out',
                    timeout = 3000,
                    background_colour = '#1a1b26',
                    render = 'default',
                    max_width = math.floor(vim.o.columns * 0.4),
                    max_height = function()
                        return math.floor(vim.o.lines * 0.3)
                    end,
                    minimum_width = 50,
                    fps = 60,
                    icons = {
                        ERROR = '',
                        WARN = '',
                        INFO = '',
                        DEBUG = '',
                        TRACE = '✎',
                    },
                }
                vim.notify = require 'notify'
            end,
        },
    },
}
