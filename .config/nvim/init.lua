require("config.options")
require("config.lazy")
require("config.keymaps")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
      install_info = {
        url = '~/code/tree-sitter-fsharp',
        files = {'fsharp/src/parser.c', 'fsharp/src/scanner.c'},
      },
      requires_generate_from_grammar = false,
      filetype = "fsharp",
}
