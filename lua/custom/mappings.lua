-- ThePrimeagen's remap
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- remap for wsl copy to windows clipboard
vim.keymap.set("v", "<leader>yy", "!clip.exe<CR>u",
  { noremap = true, silent = true, desc = "Yank to system clipboard" })

vim.keymap.set("n", "Q", "<nop>")
-- Suryansh's remap
vim.keymap.set("n", "<C-z>", "<cmd>:q<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
--harpoon++
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
-- Save file with Ctrl-s
local save_opts = { noremap = true, silent = true, desc = "Save the file" }
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", save_opts)
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", save_opts)
-- Debugger mappings
vim.keymap.set("n", "<A-b>", "<cmd> DapToggleBreakpoint <CR>")

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
