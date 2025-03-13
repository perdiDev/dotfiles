return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
	ensure_installed = { 
	    "lua", 
	    "vim", 
	    "vimdoc", 
	    "query", 
	    "markdown", 
	    "markdown_inline",
	    "go",
	    "php",
	    "zig"
	},
	sync_install = false,
	highlight = {
	    enable = true,
	    disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
		    return true
		end
	    end,
	    additional_vim_regex_highlighting = false,
	},
	indent = { enabled = true },
    }
}
