return {
      "0xstepit/flow.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        require("flow").setup{
          transparent = true,
          fluo_color = "yellow",
              mode = "bright",
              aggressive_spell = false,
            }
        vim.cmd "colorscheme flow"
      end,
}
