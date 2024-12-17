local M = {}
M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
M.mappings = {
  crates = {
    plugin = true,
    n = {
      ["<leader>rcu"] = {
        function()
          require('crates').upgrade_all_crates()
        end,
        "update crates"
      }
    }
  }
}
M.ui.hl_override=require("custom.highlights")
return M
