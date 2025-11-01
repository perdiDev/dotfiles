return {
    {
        "meson-org/mason-lspconfig.nvim",
        dependencies = {
            "mason.nvim",
            "neovim/nvim-lspconfig"
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "tailwindcss",
                "jsonls",
                "ts_ls",
                "html"
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"},
                        },
                        telemetry = { enable = false }
                    }
                }
            })
        end
    },
}
