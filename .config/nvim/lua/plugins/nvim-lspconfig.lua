return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config('rust_analyzer', {})
        vim.lsp.config('lua_ls', {})
        vim.lsp.config('clangd', {})
        vim.lsp.config('pylsp', {})

    end
}
