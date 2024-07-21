return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local on_attach = lspconfig.on_attach
        local capabilities = lspconfig.capabilities
        lspconfig.rust_analyzer.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.fsautocomplete.setup({})
        lspconfig.clangd.setup({
            --name = 'clangd',
            ----           cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
            --on_attach = function(client, bufnr)
            --    client.server_capabilties.signatureHelper = false
            --    on_attach(client, bufnr)
            --end,
            --capabilities = capabilities,
        })
    end
}
