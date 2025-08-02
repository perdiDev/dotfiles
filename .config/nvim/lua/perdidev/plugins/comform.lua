return {
    'stevearc/conform.nvim',
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cF",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
        },
    },
    opts = {
        ensure_installed = {
            "prettier"
        },
        default_format_opts = {
            timeout_ms = 3000,
            async = false, -- not recommended to change
            quiet = false, -- not recommended to change
            lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            go = {"gofmt"}
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true, -- pakai LSP kalau formatter tidak ada
        },
    },
}
