vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 5
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
require("custom.mappings")

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffaa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "NONE" })
