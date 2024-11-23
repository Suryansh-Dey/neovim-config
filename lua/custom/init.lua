vim.g.dap_virtual_text = true
vim.opt.relativenumber = true
vim.opt.number = true
require("custom.mappings")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree_*",
  callback = function()
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ffaa00" }) -- Modified files
    vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#ffaa00" }) -- Staged files
    vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff0000" }) -- Deleted files
    vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#00ffff" }) -- Merge conflicts
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#00ff00" }) -- Untracked files
    vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#888888" }) -- Ignored files
  end,
})
