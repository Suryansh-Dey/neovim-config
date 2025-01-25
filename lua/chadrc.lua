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
return M
