local M = {}
M.ui = { theme = 'onedark' }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
vim.opt.relativenumber = true
vim.opt.number = true
return M
