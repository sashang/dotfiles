return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "fsautocomplete",
                    "clangd",
                    "lua_ls",
                    "lean-language-server"
                },
            })
        end
    }
}
