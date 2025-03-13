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
            lualine = true,
            dashboard = true,
            fzf = true,
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
