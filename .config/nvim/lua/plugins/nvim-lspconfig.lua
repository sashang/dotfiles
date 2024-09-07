return {
    "neovim/nvim-lspconfig",
    config = function()
        local log_file = io.open(vim.fn.stdpath("cache") .. "/lspconfig.log", "w")
        local function log(message)
        if log_file then
            log_file:write(os.date("%Y-%m-%d %H:%M:%S ") .. message .. "\n")
            log_file:flush()
        end
            print(message)
        end

        local lspconfig = require('lspconfig')
        lspconfig.rust_analyzer.setup({})
        lspconfig.lua_ls.setup({})
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
