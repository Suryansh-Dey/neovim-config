require "nvchad.options"

local o = vim.o
o.clipboard = ""
o.cursorlineopt = 'both'
o.relativenumber = true
o.number = true
o.scrolloff = 5
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.mkdp_auto_close = 0

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffaa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "NONE" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = { 'en_us' }
    end,
    group = vim.api.nvim_create_augroup("SpellCheck", { clear = true })
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.expandtab = true
        vim.bo.softtabstop = 2
    end,
    group = vim.api.nvim_create_augroup("2-space-indentation", { clear = true })
})
vim.cmd [[ highlight Folded gui=italic 
highlight FlashBackdrop guifg=#545c7e
]]
