local map = vim.keymap.set

map("n", "<leader>;", function()
    local char = vim.fn.getcharstr()
    return '<cmd>' .. char .. '<CR>'
end, { expr = true, desc = "1 char CMD" })

map({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
map({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })
map({ "n", "x", "o" }, "c", '"_c', { noremap = true, silent = true })
map({ "n", "x", "o" }, "C", '"_C', { noremap = true, silent = true })
map({ "n", "x", "o" }, "S", '"_S', { noremap = true, silent = true })

-- yank to system clipboard
map("v", "<C-c>", "\"+y", { desc = "Copy to system clipboard" })
map({ "n", "v", "x" }, "<leader>p", '"0p', { desc = "Paste last yank" })
map("n", "<leader>m", "m", { noremap = true, desc = "Set mark" })
map("x", "p", "P", { noremap = true, desc = "Paste without yank" })
map("x", "P", "p", { noremap = true, desc = "Paste with yank" })
map('n', 'X', 'xh', { noremap = true, silent = true, desc="Delete char in cursor and move right" })

--Removing control from my life
map("n", "m", "<C-d>", { desc = "Jump to previous position" })
map("n", "M", "<C-u>", { desc = "Jump next in jumplist" })
map("n", "U", "<C-r>", { desc = "Redo" })

map("n", "<leader>k", "<cmd>cprev<CR><cmd>cclose<CR>", { desc = "Jump prev of quick fix list", silent = true })
map("n", "<leader>j", "<cmd>cnext<CR><cmd>cclose<CR>", { desc = "Jump next of quick fix list", silent = true })
map("n", "<leader>K", "<cmd>lprev<CR><cmd>lclose<CR>", { desc = "Jump prev of location list", silent = true })
map("n", "<leader>J", "<cmd>lnext<CR><cmd>lclose<CR>", { desc = "Jump next of location list", silent = true })

map("n", "<leader>q", function()
    vim.api.nvim_win_close(vim.fn.win_getid(vim.fn.winnr('#')), false)
end, { desc = "Close the previously focused window" })

--LSP mappings at ./configs/lspenable.lua
map('n', "<leader>ct", ":set filetype=", { desc = "Set file type for lsp" })
map('n', "<leader>y", "<cmd>Telescope neoclip \" extra=star<CR>",
    { noremap = true, silent = true, desc = "Open clipboard history" })
map('n', "<leader>Y", "<cmd>Telescope neoclip plus<CR>",
    { noremap = true, silent = true, desc = "Open clipboard history and put to system clipboard" })
--Multicursor mapping at ./configs/multicursor.lua
--harpoon++
for i = 1, 9, 1 do
    map("n", string.format("<leader>%s", i),
        string.format('<cmd>LualineBuffersJump %s<cr>', i),
        { desc = string.format("Open %sth Tab", i) })
end
map('n', "<leader>a", "<C-^>"
, { silent = true, desc = "Open the previously focused buffer" })

--Executors at ./../init.lua

-- Save and format file with Ctrl-s
map({ 'i', 'v', 'n' }, "<C-s>", "<Esc><cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>",
    { noremap = true, silent = true, desc = "Format then save the file then <Esc>" })

-- NVChad mappings
map('n', "<leader>n", function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
end, { desc = "Use relative number" })
-- go to  beginning and end
map('i', "<C-i>", "<ESC>^i", { desc = "Beginning of line" })
map('i', "<C-e>", "<End>", { desc = "End of line" })

-- Move cursor right if > is pressed while > is already on right
vim.keymap.set('i', '>', function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    if line:sub(col + 1, col + 1) == ">" then
        return "<Right>"
    end
    return ">"
end, { expr = true, replace_keycodes = true, desc = "Jump over > if present" })

map("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })
-- switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- select all
map("n", "<C-c>", "<ESC>ggVG", { desc = "Select whole file" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- new buffer
map("n", "<leader>b", function()
    vim.cmd [[enew]]
end, { desc = "New buffer" })
map("n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })

map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })

-- cycle through buffers
map("n", "<Tab>",
    '<cmd>bnext<cr>',
    { desc = "Goto next buffer" })
map("n", "<S-Tab>",
    '<cmd>bprevious<cr>',
    { desc = "Goto previous buffer" })
-- close buffer + hide terminal buffer
map("n", "<M-x>",
    "<cmd>bdelete<cr>",
    { desc = "Close buffer" })

-- toggle comment in both modes
map("n", "<leader>/",
    function()
        require("Comment.api").toggle.linewise.current()
    end,
    { desc = "Toggle comment" })

map("v", "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Toggle comment" }
)
-- toggle
map("n", "<A-f>", "<cmd> Neotree toggle <CR>", { desc = "Toggle file tree" })
-- focus
map("n", "<leader>e", "<cmd> Neotree focus reveal<CR>", { desc = "Focus file tree" })

map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

-- git
map("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

-- pick a hidden term
map("n", "<leader>ft", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })

map("n", "<leader>fb", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" })
-- toggle in terminal mode
map({ "n", "t" }, "<A-v>", function()
    require("configs.nvterm").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("configs.nvterm").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("configs.nvterm").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("n", "<leader>h", function()
    require("configs.nvterm").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
    require("configs.nvterm").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

map("n", "<leader>wK",
    function()
        vim.cmd "WhichKey"
    end,
    { desc = "Which-key all keymaps" })
map("n", "<leader>wk",
    function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
    end,
    { desc = "Which-key query lookup" })

map("n", "<leader>cc",
    function()
        require("treesitter-context").go_to_context(vim.v.count1)
    end,
    { desc = "Jump to sticky context", silent = true }
)

-- Navigation through hunks
map("n", "]h",
    function()
        vim.schedule(function()
            require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
    end,
    { desc = "Jump to next hunk", expr = true }
)

map("n", "[h",
    function()
        vim.schedule(function()
            require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
    end,
    { desc = "Jump to prev hunk", expr = true }
)

-- Actions
map("n", "<leader>rh",
    function()
        require("gitsigns").reset_hunk()
    end,
    { desc = "Reset hunk" })

map("n", "<leader>gh",
    function()
        require("gitsigns").preview_hunk_inline()
    end,
    { desc = "Preview hunk" })

map("n", "<leader>gs",
    function()
        require("gitsigns").stage_hunk()
    end,
    { desc = "Stage hunk" })

map("n", "<leader>gb",
    function()
        package.loaded.gitsigns.blame_line()
    end,
    { desc = "Blame line" })

map("n", "<leader>td",
    function()
        require("gitsigns").toggle_deleted()
    end,
    { desc = "Toggle deleted" })
