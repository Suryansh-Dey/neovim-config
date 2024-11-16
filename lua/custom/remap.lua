vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>yy", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>YY", [["+Y]], { desc = "Yank to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Delete to system clipboard" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- Suryansh's remap
vim.keymap.set("n", "<C-z>", "<nop>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
vim.api.nvim_set_keymap(
  'n',
  '<leader>fS',
  "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
  { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
