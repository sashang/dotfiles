return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local install = require("nvim-treesitter.install")
    install.command_extra_args = {curl = {"-k"}}

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.fsharp = {
      install_info = {
        url = 'https://github.com/ionide/tree-sitter-fsharp',
        branch = 'main',
        files = { 'src/scanner.c', 'src/parser.c' },
        location = 'fsharp',
      },
      requires_generate_from_grammar = false,
      filetype = "fsharp",
    }

    parser_config.asciidoc = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc",
        location = "tree-sitter-asciidoc",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "master",
      },
      filetype = "asciidoc",
    }

    parser_config.asciidoc_inline = {
      install_info = {
        url = "https://github.com/cathaysia/tree-sitter-asciidoc",
        location = "tree-sitter-asciidoc_inline",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "master",
      },
    }

    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "fsharp",
        "rust",
        "cpp",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "rust",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "asciidoc",
        "asciidoc_inline",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
