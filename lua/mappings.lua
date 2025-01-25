require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- ThePrimeagen's remap
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>k", "<cmd>cprev<CR>")
map("n", "<leader>j", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>lprev<CR>")
map("n", "<M-j>", "<cmd>lnext<CR>")
map("n", "<leader><leader>", "<cmd>cclose<CR>")

-- remap for wsl copy to windows clipboard
map("v", "<leader>yy", "!clip.exe<CR>u",
  { noremap = true, silent = true, desc = "Yank to system clipboard" })

map("n", "Q", "<nop>")
-- Suryansh's remap
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
map('n', '<leader>fs', function()
  require('telescope.builtin').lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
--harpoon++
for i = 1, 9, 1 do
  map("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Open %sth Tab", i) })
end
-- Save and format file with Ctrl-s
map({ 'i', 'v' }, "<C-s>", "<Esc><cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>",
  { noremap = true, silent = true, desc = "Format then save the file then <Esc>" })
-- Debugger mappings
map("n", "<M-b>", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<M-c>", function() require('dap').continue() end, { desc = "Debugger continue" })
map("n", "<M-n>", function() require('dap').step_over() end, { desc = "Debugger step_over" })
map("n", "<M-d>", function() require('dap').step_into() end, { desc = "Debugger step_into" })
map("n", "<M-o>", function() require('dap').step_out() end, { desc = "Debugger step_out" })
map("n", "<M-x>", function() require('dap').terminate() end, { desc = "Debugger terminate" })
