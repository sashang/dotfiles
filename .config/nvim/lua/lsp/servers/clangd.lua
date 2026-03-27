local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

if not configs.clangd then
  configs.clangd = {
    default_config = {
      cmd = { "clangd", "--background-index", "--clang-tidy" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = util.root_pattern("compile_commands.json", ".git"),
    },
  }
end
