return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        opts = {
            size = 12,
            open_mapping = [[<c-.>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            persist_size = true,
            direction = 'horizontal',
            float_opts = {
                border = 'curved',
                width = 80,
                height = 25,
                row = 50,
                col = 50,
                winblend = 3,
                zindex = 1000,
                title_pos = 'right',
            },

            close_on_exit = true,
            shell = vim.o.shell,
        },
    },
}
