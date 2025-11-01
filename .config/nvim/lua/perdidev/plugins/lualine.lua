local colors = require("perdidev.config.pallates")

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local bugisTheme = require('lualine.themes.catppuccin')

        bugisTheme.normal.z = { bg = colors.sapphire, fg = colors.base }
        bugisTheme.insert.z = { bg = colors.peach, fg = colors.base }
        bugisTheme.command.z = { bg = colors.flamingo, fg = colors.base }
        bugisTheme.terminal.z = { bg = colors.flamingo, fg = colors.base }

        return {
            options = {
                theme = bugisTheme,
                fmt = string.lower,
                section_separators   = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        "filename",
                        separator = { left = "  " },
                        color = {bg = colors.red, fg = colors.base, gui = 'bold'},
                    },
                    {
                        "branch",
                        icon = "",
                        separator = { right = "" },
                        color = {bg = colors.red, fg = colors.base},
                    }
                },
                lualine_b = {},
                lualine_c = {
                    {
                        "diff",
                        colored = true,
                        diff_color = {
                            added = { fg = colors.sky },
                            modified = { fg = colors.peach },
                            removed = { fg = colors.maroon },
                        },
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                    },
                    {
                        "buffer",
                        hide_filename_extension = true,
                        mode = 3,
                    },
                },
                lualine_x = {
                    {
                        'lsp_status',
                        icon = "",
                        symbols = {
                            done = '✓',
                            separator = ' ',
                        },
                        ignore_lsp = {},
                        show_name = true,
                    }
                },
                lualine_y = {
                    {
                        'searchcount',
                        maxcount = 999,
                        timeout = 500,
                    }
                },
                lualine_z = {
                    {
                        "progress",
                        separator = { left = ""}
                    },
                    {
                        "mode",
                        separator = { right = "  "},
                        color = { fg = colors.crust, gui = 'bold' }
                    }
                },
            },
        }
    end
}
