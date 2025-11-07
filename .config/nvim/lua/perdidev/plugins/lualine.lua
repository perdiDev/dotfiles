local colors = require("perdidev.config.pallates")

local project = function()
    local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return dir
end

local tabcount = function()
    return vim.fn.tabpagenr("$")
end

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
                always_show_tabline = false,
                globalstatus = true,
            },

            sections = {
                lualine_a = {
                    {
                        project,
                        file_status = false,
                        draw_empty = true,
                        separator = { left = "  " },
                        color = {bg = colors.red, fg = colors.base, gui = 'bold'},
                    },
                    {
                        "filename",
                        cond = function()
                            if tabcount() > 1 then
                                return false
                            else
                                return true
                            end
                        end,
                        symbols = {
                            modified = "󰐾",
                            readonly = "",
                            unnamed = "",
                            newfile = "",
                        },
                        icon = "",
                        color = {bg = colors.red, fg = colors.base, gui = 'bold'},
                    },
                    {
                        "branch",
                        icon = "",
                        draw_empty = true,
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
                },

                lualine_x = {
                    {
                        "diagnostics"
                    },
                    {
                        "filetype",
                        colored = false,
                        icon_only = true,
                    },
                    {
                        'lsp_status',
                        icon = "",
                        symbols = {
                            done = '✓',
                            separator = ' ',
                        },
                        ignore_lsp = {},
                        show_name = true,
                    },
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
                        draw_empty = true,
                        separator = { left = ""}
                    },
                    {
                        "mode",
                        draw_empty = true,
                        separator = { right = "  "},
                        color = { fg = colors.crust, gui = 'bold' }
                    }
                },
            },

            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        mode = 1,
                        path = 1,
                        separator = { right = "" },
                        tabs_color = {
                            active = { bg = colors.rosewater, fg = colors.base },
                            inactive = { bg = colors.overlay0, fg = colors.base }
                        },
                        symbols = {
                            modified = "󰐾"
                        },
                        fmt = function (name)
                            return " " .. name
                        end,
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
        }
    end
}
