-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

map("n", "<leader>e", ":Ex<Cr>", { desc = "To menu explore", silent = true})
map("n", "<leader>qq", ":quit<Cr>", { desc = "Quit from project", silent = true })
