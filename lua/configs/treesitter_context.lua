local TSContext = require("treesitter-context")
TSContext.setup({
  enable = true,               -- Enable this plugin
  max_lines = 0,               -- How many lines the window should span
  trim_scope = "outer",        -- Which context lines to discard
  min_window_height = 0,       -- Minimum editor window height to enable context
  mode = "topline",            -- Line used to calculate context; options: 'cursor', 'topline'
  separator = nil,             -- Separator between context and content; pass a string for a custom separator
})
vim.cmd [[
    highlight TreesitterContextBottom gui=underline guisp=Grey
    highlight TreesitterContextLineNumberBottom gui=underline guisp=Grey
]]
