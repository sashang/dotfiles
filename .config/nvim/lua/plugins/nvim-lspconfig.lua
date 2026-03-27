return {
  "neovim/nvim-lspconfig",
  -- force the lsp setup to load before the nvim loads the buffer type.
  lazy = false,
  config = function()
    require("lsp")
  end,
}
