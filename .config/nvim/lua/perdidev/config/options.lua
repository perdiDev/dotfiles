-- LazyVim autoformat
vim.g.autoformat = true

local opt = vim.opt

-- sync with system clipboard
opt.clipboard = "unnamedplus"

-- line number
opt.number	        = true -- show number
opt.pumblend	    = 10
opt.pumheight	    = 10
opt.relativenumber  = true

-- tab config
opt.expandtab = true	-- use spaces intead of tab
opt.tabstop = 4		-- number of spaces tab count for
opt.shiftwidth = 4	-- size of an indent

-- indent config
opt.smartindent = true	-- insert indent automatically
opt.shiftround = true	-- round indent

-- case sensitive
opt.ignorecase = true	-- ignore case
opt.smartcase = true	-- dont ingnore case with capitals

opt.wrap = false	-- disable wrap line
opt.scrolloff = 4	-- line of context
