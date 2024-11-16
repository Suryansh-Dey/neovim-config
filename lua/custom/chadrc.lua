local M = {}
M.ui = { theme = 'dark_horizon' }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
vim.opt.relativenumber = true
vim.opt.number = true
return M
