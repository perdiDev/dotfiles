return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    ---@type CatppuccinOptions
    opts = {
        highlight = {
            enabled = true,
            additional_vim_regex_highlighting = false
        },

        -- plugin integrations
        integrations = {
            treesitter = true,
            blink_cmp = {
                style = "bordered",
            },
            fzf = true,
            gitsigns = true,
            lualine = true,
            mason = true,
            snacks = {
                enabled = false,
                indent_scope_color = "lavender",
            },
        }
    },

    config = function()
        -- load colorsheme
        vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}

