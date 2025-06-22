return { 
    {
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            -- load colorsheme
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
        integrations = {
            treesitter = true,
            lualine = true,
            dashboard = true,
            fzf = true,
            snacks = {
                enabled = false,
                indent_scope_color = "lavender",
            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
            if (vim.g.colors_name or ""):find("catppuccin") then
                opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
            end
        end,
    }
}
