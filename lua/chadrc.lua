---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tokyonight",

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
    },
    sizes = {
        vsp = 0.5
    }
}

M.ui = {
    tabufline = {
        modules = {
            btns = function()
                return ""
            end,
        },
    }
}

return M
