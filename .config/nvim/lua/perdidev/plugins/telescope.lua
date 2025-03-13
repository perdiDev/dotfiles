return {
    {
        'nvim-telescope/telescope.nvim',
        enabled = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>ft", "<cmd>Telescope find_file<cr>", desc = "Search file" },
        },
    },
    {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', enabled = false }
    }
}
