local header_ascii = [[
                    _ _     _              
 _ __   ___ _ __ __| (_) __| | _____   __
| '_ \ / _ \ '__/ _` | |/ _` |/ _ \ \ / /
| |_) |  __/ | | (_| | | (_| |  __/\ V / 
| .__/ \___|_|  \__,_|_|\__,_|\___| \_/  
|_|                                      
]]

---@type snacks.dashboard.Config
local dashboard = {
    enabled = true,
    preset = {
        header = header_ascii,
        keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            -- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
    },
    formats = {},
    sections = {
        { section = "header", align = "center", padding = {0, 0} },
        { section = "keys", gap = 1, padding = 1, title = "Don't be perfect\n" },
        { section = "startup", align = "center" },
    },
}

---@type snacks.scroll.Config
local scroll = {
    enabled = true,
}

return {
    enabled = true,
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        ---@type snacks.animate.Config
        animate = {
            duration = 200,
            easing = "inOutQuart"
        },
        animate_repeat = {
            delay = 100, -- delay in ms before using the repeat animation
            duration = { step = 5, total = 50 },
            easing = "inOutQuart",
        },

        ---@type snacks.bigfile.Config
        bigfile = { enabled = true },

        -- dashboard
        dashboard = dashboard,

        ---@type snacks.explorer.Config
        explorer = { enabled = true, replace_netrw = false },

        ---@type snacks.indent.Config
        indent = {
            enabled = true,
            only_scope = true,
            only_current = true,
        },

        ---@type snacks.indent.Config
        input = { enabled = true },

        ---@type snacks.notifier.Config
        notifier = {
            enabled = true,
            timeout = 3000,
        },

        ---@type snacks.notifier.Config
        quickfile = { enabled = true },

        ---@type snacks.scope.Config
        scope = { enabled = true },

        ---@type snacks.scroll.Config
        scroll = scroll,

        ---@type snacks.statuscolumn.Config
        statuscolumn = {
            enabled = true,
            left = { "sign", "mark" },
            right = { "fold", "git" },
            folds = {
                open = false, -- show open fold icons
                git_hl = false, -- use Git Signs hl for fold icons
            },
            git = {
                -- patterns to match Git signs
                patterns = { "GitSign" },
            },
            refresh = 50, -- refresh at most every 50ms
        },
        styles = {
            notification = {
                wo = { wrap = true } -- Wrap notifications
            }
        }
    },
}
