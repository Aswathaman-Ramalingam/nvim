return {
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup(){
                    automatic_enable = {
        "lua_ls",
        "vimls"
    }
            }
        end
    },
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },

}
