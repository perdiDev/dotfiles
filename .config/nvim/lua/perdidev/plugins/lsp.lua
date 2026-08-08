return {
    {
        "mason-org/mason.nvim",
        lazy = true,
        opts = {
            ui = {
                border = "rounded",
                width = 0.8,
                height = 0.8
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = true,
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "tailwindcss",
                "jsonls",
                "ts_ls",
                "html"
            },
            automatic_enable = true
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            'saghen/blink.cmp',
            'mason.nvim',
            'mason-org/mason-lspconfig.nvim',
        },
        config = function()
            local lspServer = require('mason-lspconfig').get_installed_servers()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            for _, server in pairs(lspServer) do
                vim.lsp.config(server, {
                    capabilities = capabilities
                })
            end

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("data") .. "/lazy"] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true, -- your own config
                            }
                        },
                        telemetry = { enable = false }
                    }
                }
            })
        end
    },
}
