--nvchad options
local o = vim.o
local opt = vim.opt
local g = vim.g

o.showmode = false
o.splitkeep = "screen"

o.cursorline = true
o.cursorlineopt = "number"

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

--my options
o.clipboard = ""
o.relativenumber = true
o.number = true
o.scrolloff = 3
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
opt.spell = true
opt.spelllang = { 'en_us' }

--plugins
vim.g.mkdp_auto_close = 0

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffaa00", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "NONE" })
vim.api.nvim_set_hl(0, 'SnippetTabstop', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bold = true, bg = "NONE" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bold = true, bg = "NONE" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
    end,
    group = vim.api.nvim_create_augroup("2-space-indentation", { clear = true })
})
vim.o.jumpoptions = 'view'

if vim.g.started_by_firenvim then
    vim.o.laststatus = 0
    vim.o.guifont = "monospace:h14"
    vim.opt.swapfile = false
    vim.opt.shadafile = "NONE"
    vim.opt.report = 999999
    -- Put in insert mode if empty
    vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
        callback = function()
            if vim.bo.filetype ~= "markdown" then return end

            local line_count = vim.api.nvim_buf_line_count(0)
            local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)

            if (line_count == 1 and #lines[1] == 0) or (line_count == 2 and #lines[1] == 0 and #lines[2] == 0) then
                vim.cmd("startinsert")
            end
        end
    })
end
