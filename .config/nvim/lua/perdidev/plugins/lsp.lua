return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "tailwindcss",
                "jsonls",
                "ts_ls",
                "html"
            },
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide targeted overrides for specific servers.
                ["rust_analyzer"] = function ()
                    require("rust-tools").setup {}
                end,
            }
        },
        dependencies = {
            "mason.nvim",
        }
    },
    {
        "neovim/nvim-lspconfig",
    }
}
