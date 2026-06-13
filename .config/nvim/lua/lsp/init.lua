vim.lsp.set_log_level("trace")
local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())

local rust_opts = require("lsp.servers.rust")
vim.lsp.config("rust_analyzer", vim.tbl_deep_extend("force", rust_opts, { capabilities = capabilities }))
vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.config("mojo", { capabilities = capabilities })

vim.lsp.config("fsautocomplete", { 
  capabilities = fsharp_capabilities,
  on_init = function(client)
    -- Disable semantic tokens to prevent 100% CPU lockups in the Neovim LSP worker.
    -- fsautocomplete can send extremely large or overlapping token arrays in the background
    -- (often triggered around the same time as a hover request), causing Neovim's internal
    -- semantic token parser to infinite loop. We rely on Tree-sitter for highlighting instead.
    client.server_capabilities.semanticTokensProvider = nil
  end
})

vim.lsp.enable({ "rust_analyzer", "clangd", "mojo", "fsautocomplete", "lua_ls" })

