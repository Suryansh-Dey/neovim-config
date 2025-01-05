-- ThePrimeagen's remap
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<S-M-k>", "<cmd>lprev<CR>")
vim.keymap.set("n", "<S-M-j>", "<cmd>lnext<CR>")

-- remap for wsl copy to windows clipboard
vim.keymap.set("v", "<leader>yy", "!clip.exe<CR>u",
  { noremap = true, silent = true, desc = "Yank to system clipboard" })

vim.keymap.set("n", "Q", "<nop>")
-- Suryansh's remap
vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
--harpoon++
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Open %sth Tab", i) })
end
-- Save and format file with Ctrl-s
vim.keymap.set({ 'i', 'n', 'v' }, "<C-s>", "<Esc><cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>",
  { noremap = true, silent = true, desc = "Format then save the file then <Esc>" })
-- Debugger mappings
vim.keymap.set("n", "<M-b>", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<M-c>", function() require('dap').continue() end, { desc = "Debugger continue" })
vim.keymap.set("n", "<M-n>", function() require('dap').step_over() end, { desc = "Debugger step_over" })
vim.keymap.set("n", "<M-d>", function() require('dap').step_into() end, { desc = "Debugger step_into" })
vim.keymap.set("n", "<M-o>", function() require('dap').step_out() end, { desc = "Debugger step_out" })
vim.keymap.set("n", "<M-x>", function() require('dap').terminate() end, { desc = "Debugger terminate" })
