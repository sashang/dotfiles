return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.rust_analyzer.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.fsautocomplete.setup{
            root_dir = lspconfig.util.root_pattern('*.fsproj', '*.sln', '.git'),
            cmd = { 'fsautocomplete', '--adaptive-lsp-server-enabled' },
            filetypes = { 'fsharp' },
            init_options = {
                AutomaticWorkspaceInit = false,
            },
            settings = {
                FSharp = {
                    UnusedDeclarationsAnalyzer = false,
                    UnusedOpensAnalyzer = false,
                    EnableReferenceCodelens = false,
                    excludeProjectDirectories = {
                        ".git",
                        "paket-files",
                        ".paket",
                        ".github",
                        ".idea",
                        "obj",
                        "bin",
                        "deploy",
                        "dist",
                        "node_modules",
                        ".vscode",
                        "vsintegration"
                    },
                    enableAdaptiveLspServer = true
                },
            },
        }
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
