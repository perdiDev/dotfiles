return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    enabled = false,
    opts = function()
        local header = table.concat({
            "    ╔════════════════════════════════════════════════════════════════════╗",
            "    ║  ██████╗ ███████╗██████╗ ██████╗ ██╗██████╗ ███████╗██╗   ██╗  ⚡  ║",
            "    ║  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗██╔════╝██║   ██║      ║",
            "    ║  ██████╔╝█████╗  ██████╔╝██║  ██║██║██║  ██║█████╗  ██║   ██║  🔥  ║",
            "    ║  ██╔═══╝ ██╔══╝  ██╔══██╗██║  ██║██║██║  ██║██╔══╝  ╚██╗ ██╔╝      ║",
            "    ║  ██║     ███████╗██║  ██║██████╔╝██║██████╔╝███████╗ ╚████╔╝   💻  ║",
            "    ║  ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═════╝ ╚══════╝  ╚═══╝        ║",
            "    ╚═══════════════════════ CODE • CREATE • CONQUER ═══════════════════╝",
        }, "\n")
        header = string.rep("\n", 4) .. header .. string.rep("\n", 4)

        local footer = table.concat({
            "PERDIDEV - Time to deploment",
        }, "\n")
        footer = string.rep("\n", 4) .. footer .. "\n"

        local opts = {
            theme = 'hyper',
            hide = {
                -- Set to true to hide these UI elements
                statusline = true,
                tabline = true,
                winbar = true,
            },
            config = {
                header = vim.split(header, "\n"),
                shortcut = {
                    { 
                        desc = '󰊳 Update', 
                        group = '@property', 
                        action = 'Lazy update', 
                        key = 'u' 
                    },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'FzfLua files',
                        key = 'f',
                    },
                    {
                        desc = ' Apps',
                        group = 'DiagnosticHint',
                        action = 'Telescope app',
                        key = 'a',
                    },
                    {
                        desc = ' dotfiles',
                        group = 'Number',
                        action = 'Fzf help',
                        key = 'd',
                    },
                },
                packages = {
                    enable = false,
                },
                project = {
                    enable = true,
                    limit = 3,
                },
                mru = {
                    enable = true,
                    limit = 3,
                },
                footer = vim.split(footer, "\n"),
            },
        }
        return opts
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
