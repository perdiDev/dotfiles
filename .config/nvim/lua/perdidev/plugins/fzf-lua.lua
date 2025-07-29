return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>p", ":FzfLua files<Cr>", desc = "Find on path" },
        { "<leader>P", ":FzfLua commands<Cr>", desc = "Search nvim command" },
    },
    opts = {},
}
