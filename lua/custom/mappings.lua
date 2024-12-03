-- ThePrimeagen's remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>yy", [["+y]], { desc = "Yank to system clipboard" })
-- vim.keymap.set("n", "<leader>YY", [["+Y]], { desc = "Yank to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Delete to system clipboard" })
-- above remap dont work for wsl so below is there replacement
vim.keymap.set("v", "<leader>yy", "!clip.exe<CR>u",
  { noremap = true, silent = true, desc = "Yank to system clipboard" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- Suryansh's remap
vim.keymap.set("n", "<C-z>", "<cmd>:q<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
vim.api.nvim_set_keymap(
  'n',
  '<leader>fS',
  "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
  { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "rust" then
      vim.lsp.buf.format({ async = false })
    end
  end,
})
vim.keymap.set("n", "<A-e>", function()
  vim.diagnostic.open_float()
end, { desc = "See error in floating window" })
vim.keymap.set('n', "<A-k>", function()
  vim.lsp.buf.hover()
end, { desc = "Know about the element" })
vim.keymap.set("n", "<leader>re", function()
  vim.lsp.buf.rename()
end, { desc = "Rename the identifier" })
-- Save file with Ctrl-s
local save_opts = { noremap = true, silent = true, desc = "Save the file" }
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", save_opts)
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", save_opts)
-- Debugger mappings
vim.keymap.set("n", "<A-b>", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<A-s>",
  function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
  end,
  { desc = "Open debugging sidebar" }
)
vim.keymap.set("n", "<A-c>", function()
  require('dap').continue()
end, { desc = "Debugger continue" })
vim.keymap.set("n", "<A-j>", function()
  require('dap').step_over()
end, { desc = "Debugger step_over" })
vim.keymap.set("n", "<A-d>", function()
  require('dap').step_into()
end, { desc = "Debugger step_into" })
vim.keymap.set("n", "<A-o>", function()
  require('dap').step_out()
end, { desc = "Debugger step_out" })
vim.keymap.set("n", "<A-x>", function()
  require('dap').terminate()
end, { desc = "Debugger terminate" })
