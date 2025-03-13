return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader>p", ":FzfLua files<Cr>", desc = "Find on path" },
        { "<leader>P", ":FzfLua commands<Cr>", desc = "Search nvim command" },
        -- git
        { "<leader>gf", ":FzfLua git_files<Cr>", desc = "Git ls-files" },
        { "<leader>gs", ":FzfLua git_status<Cr>", desc = "Git status files" },
        { "<leader>gb", ":FzfLua git_branches<Cr>", desc = "Git branch files" },
    },
    opts = {},
}
