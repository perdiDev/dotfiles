return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
	-- load colorsheme
	vim.cmd([[colorscheme catppuccin-mocha]])
    end,
    integrations = {
	lualine = true
    }
}
