return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    opts = {
        ---@type string[]
        ensure_installed = {'lua', 'vim', 'vimdoc', 'bash', 'go', 'gomod', 'php', 'phpdoc', 'blade' };
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

