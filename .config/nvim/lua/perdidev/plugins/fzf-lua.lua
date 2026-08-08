return {
    "ibhagwan/fzf-lua",
    lazy = false,
    keys = {
        { "<leader>p", ":FzfLua files<Cr>", desc = "Find on path" },
        { "<leader>P", ":FzfLua commands<Cr>", desc = "Search nvim command" },
        { "<leader>pc", "<cmd>FzfLua files cwd = stdpath('config')<Cr>", desc = "Find on nvim config"}
    },
    opts = {},
}
