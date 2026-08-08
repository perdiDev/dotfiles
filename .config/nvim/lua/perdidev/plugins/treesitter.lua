local tsbranch = "master"
local ensure_installed = {'lua', 'vim', 'vimdoc', 'bash', 'go', 'gomod', 'php', 'phpdoc', 'blade' }

local mainconfig = {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ---@type string[]
        ensure_installed = ensure_installed;
    },
    config = function(_, opts)
        local TS = require("nvim-treesitter")
        local server = opts.ensure_installed

        vim.api.nvim_create_autocmd({'FileType'}, {
            pattern = server,
            callback = function (env)
                local filetype = vim.bo.filetype

                if vim.list_contains(TS.get_installed(), filetype) then
                    if vim.treesitter.language.add(filetype) then
                        vim.treesitter.start(env.buf)
                        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                elseif vim.list_contains(server, filetype) then
                    TS.install({filetype}, { summary = true }):wait(3 * 60 * 1000) -- 3 menit
                end
            end
        })
    end
}

local masterconfig = {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    opts = {
        ensure_installed = ensure_installed,
        sync_install = false,
        auto_install = false,
        ignore_install = {},

        -- parser_install_dir = "/some/path/to/store/parsers", 
        -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
            enable = true,

            disable = function(_, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,

            additional_vim_regex_highlighting = false,
        },
    }
}

return tsbranch == "main" and mainconfig or masterconfig
