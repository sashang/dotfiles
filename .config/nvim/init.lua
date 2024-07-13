require("config.lazy")
require("config.options")
require("config.keymaps")
require("plugins.treesitter")
require("mason").setup()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/ionide/tree-sitter-fsharp",
    branch = "main",
    files = {"src/scanner.c", "src/parser.c" },
  },
  filetype = "fsharp",
}
