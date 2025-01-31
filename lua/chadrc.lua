---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ayu_dark",

    hl_override = {
        Comment = { italic = true },
        LineNr = { fg = "#777777" },
        CursorLineNr = { fg = "#ffffff" },
    },
}

M.nvdash = { load_on_startup = true }

M.term = {
    float = {
        relative = "editor",
        row = 0,
        col = 0,
        width = vim.o.columns,
        height = vim.o.lines,
    }
}

return M
