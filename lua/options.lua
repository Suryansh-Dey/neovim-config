require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 5

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffaa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "NONE" })
