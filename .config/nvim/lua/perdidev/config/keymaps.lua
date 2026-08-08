-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- toogle netrw
map("n", "<leader>e", function ()
    if vim.bo.filetype == "netrw" then
        vim.cmd("Rexplore")
    else
        vim.cmd("Explore")
    end
end,
{ desc = "Toogle netrw", silent = true})

-- Quit
map("n", "<leader>qq", "<cmd>quit<CR>", { desc = "Quit", silent = true })

map("n", "<leader>%%", function()
    local path = vim.fn.stdpath("config")

    print("Reloaded " .. (path or 'config'))
    vim.cmd.source(path .. "/init.lua")
end,  { desc = "Reload Nvim", silent = true })

map("n", "<leader>%l", "<cmd>Lazy reload<CR>", { desc = "Reload lazy", silent = true })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write", silent = true })

