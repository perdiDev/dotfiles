-- leader
vim.g.mapleader = " "

-- LazyVim autoformat
vim.g.autoformat = true

local opt = vim.opt

-- line number
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true

-- wrap line
opt.wrap = true
opt.smartindent = true

-- autoindent
vim.cmd.set("autoindent")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("softtabstop=4")
