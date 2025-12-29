vim.g.mapleader = " "
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    { import = "plugins" },
}, lazy_config)

require "options"

--mappings
vim.api.nvim_create_augroup("executeFile", { clear = true })
for lang, keymap in pairs(require('executors')) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = lang,
        callback = keymap,
        group = "executeFile"
    })
end
vim.schedule(function()
    require "mappings"
end)
