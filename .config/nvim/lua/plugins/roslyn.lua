return {
  "seblj/roslyn.nvim",
  ft = "cs",
  opts = {
    config = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      settings = {
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "openFiles",
        },
      },
    },
    filewatching = "off",  -- disable Roslyn's internal file watcher, avoids a stack overflow when it recurses too deep.
  },
}
