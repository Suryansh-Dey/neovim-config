function CREATE_FILE_IF_MISSING(filepath, content)
    filepath = vim.fn.expand(filepath)
    if not vim.uv.fs_stat(filepath) then
        local file = io.open(filepath, "w")
        if file then
            file:write(content)
            file:close()
            print("File created: " .. filepath)
        else
            print("Error creating file: " .. filepath)
        end
    end
end

vim.g.mapleader = " "
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }

    CREATE_FILE_IF_MISSING("~/.clang-format", [[BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never]])
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

vim.api.nvim_create_user_command("TSInstallAll", function()
    local parsers = {
        "html", "css", "javascript", "tsx", "typescript", "json",
        "cpp", "rust", "markdown", "python", "java", "lua",
        "luadoc", "printf", "vim", "vimdoc"
    }
    require('nvim-treesitter').install(parsers)
end, {})
