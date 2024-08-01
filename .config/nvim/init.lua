require("config.lazy")
require("config.options")
require("config.keymaps")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
      install_info = {
        url = '~/code/tree-sitter-fsharp', -- local path or git repo
        files = {'src/parser.c', 'src/scanner.c'}, -- note that some parsers also require src/scanner.c or src/scanner.cc
      },
      requires_generate_from_grammar = false,
      filetype = "fsharp",
}
