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
vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg })

vim.opt.laststatus = 0
local status_toggle_grp = vim.api.nvim_create_augroup("StatusToggle", { clear = true })
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
    group = status_toggle_grp,
    callback = function()
        local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        if errors > 0 or warnings > 0 then
            vim.opt.laststatus = 3
        else
            vim.opt.laststatus = 0
        end
    end,
})
