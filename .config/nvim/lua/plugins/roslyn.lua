return {
  "seblj/roslyn.nvim",
  ft = "cs",
  opts = {
    config = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    },
  },
}
