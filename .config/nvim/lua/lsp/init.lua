local capabilities = require("cmp_nvim_lsp").default_capabilities()

local rust_opts = require("lsp.servers.rust")
vim.lsp.config("rust_analyzer", vim.tbl_deep_extend("force", rust_opts, { capabilities = capabilities }))
vim.lsp.config("clangd", { capabilities = capabilities })

vim.lsp.enable({ "rust_analyzer", "clangd" })
