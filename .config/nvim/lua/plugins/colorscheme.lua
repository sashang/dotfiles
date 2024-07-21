return {
    "folke/tokyonight.nvim", -- github name goes here: https://github.com/folke/tokyonight.nvim
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme tokyonight]])
    end
}
