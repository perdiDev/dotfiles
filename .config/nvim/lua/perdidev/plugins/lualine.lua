return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
            -- section_separators = '', component_separators = '',
            theme = 'palenight',
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'searchcount'}
            }
        }
    }
}
