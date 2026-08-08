return {
    'saghen/blink.cmp',
    version = '1.*',
    event = {"InsertEnter", "CmdLineEnter"},
    dependencies = { 'rafamadriz/friendly-snippets', lazy = false },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },
        cmdline = { enabled = true },

        appearance = { nerd_font_variant = 'mono' },

        completion = {
            documentation = { auto_show = false },
            menu = {
                draw = { treesitter = { 'lsp' } }
            }
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                "score",
                "sort_text",
                "label",
                "kind"
            }
        }
    },
    opts_extend = { "sources.default" }
}

