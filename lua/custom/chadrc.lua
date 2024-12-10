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
return M
