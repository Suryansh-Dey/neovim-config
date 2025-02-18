local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

map("n", "<leader>k", "<cmd>cprev<CR><cmd>cclose<CR>", { desc = "Move to next in quick fix list" })
map("n", "<leader>j", "<cmd>cnext<CR><cmd>cclose<CR>", { desc = "Move to next in quick fix list" })
map("n", "<leader>K", "<cmd>lprev<CR><cmd>lclose<CR>", { desc = "Move to next in location list" })
map("n", "<leader>J", "<cmd>lnext<CR><cmd>lclose<CR>", { desc = "Move to next in location list" })

local previous_win = nil
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        previous_win = vim.api.nvim_get_current_win()
    end
})
vim.keymap.set("n", "Q", function()
    if previous_win and vim.api.nvim_win_is_valid(previous_win) then
        vim.api.nvim_win_close(previous_win, false)
    else
        print("No valid previous window to close")
    end
end, { desc = "Close the previously focused window" })

map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file" })
map('n', '<leader>fs', function()
    require('telescope.builtin').lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Search symbols in workspace" }
)
map('n', "<leader>ft", ":set filetype=", { desc = "Set file type for lsp" })
map('n', "<leader>y", "<cmd>Telescope neoclip \" extra=star<CR>",
    { noremap = true, silent = true, desc = "Put yank nvim clipboard" })
map('n', "<leader>Y", "<cmd>Telescope neoclip plus<CR>",
    { noremap = true, silent = true, desc = "Put yank to system clipboard" })
--harpoon++
local previous_buf = nil
for i = 1, 9, 1 do
    map("n", string.format("<leader>%s", i), function()
        if i > #vim.t.bufs then
            i = #vim.t.bufs
        end
        local current_buf = vim.api.nvim_get_current_buf()
        if vim.t.bufs[i] ~= current_buf then
            previous_buf = current_buf
        end
        require("nvchad.tabufline").goto_buf(vim.t.bufs[i])
    end, { desc = string.format("Open %sth Tab", i) })
end
local tab_count = #vim.t.bufs
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function(args)
        if tab_count < #vim.t.bufs then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", false)
            vim.schedule(function()
                previous_buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_set_current_buf(args.buf)
            end)
        end
        tab_count = #vim.t.bufs
    end
})
vim.keymap.set('n', "<leader><leader>", function()
    if previous_buf and vim.api.nvim_buf_is_valid(previous_buf) then
        local current_buf = vim.api.nvim_get_current_buf()
        require("nvchad.tabufline").goto_buf(previous_buf)
        previous_buf = current_buf
    else
        print("No valid previous buffer to open")
    end
end, { desc = "Open the previously focused buffer" })
vim.keymap.set('n', "<C-o>", function()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", false)
    if previous_buf ~= current_buf then
        previous_buf = current_buf
    end
end, { noremap = true })
-- Save and format file with Ctrl-s
map({ 'i', 'v', 'n' }, "<C-s>", "<Esc><cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>",
    { noremap = true, silent = true, desc = "Format then save the file then <Esc>" })
-- Debugger mappings
-- -- Moved to plugins/init for lazy loading
-- Reply to Shreyas
local function buf_index(bufnr)
    for i, value in ipairs(vim.t.bufs) do
        if value == bufnr then
            return i
        end
    end
end

map('n', "<leader>tm", function()
    local n = tonumber(vim.fn.input("Move tab by (negetive number to move left): "))
    local current_idx = buf_index(vim.api.nvim_get_current_buf())
    if current_idx + n > #vim.t.bufs then
        n = #vim.t.bufs - current_idx
    end
    if current_idx + n < 1 then
        n = -current_idx + 1
    end
    require('nvchad.tabufline').move_buf(n)
end, { desc = "Move the tab position" })

-- NVChad mappings
map('n', "<leader>n", function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
end, { desc = "Use relative number" })
-- go to  beginning and end
map('i', "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map('i', "<C-e>", "<End>", { desc = "End of line" })

-- navigate within insert mode
map('i', "<C-h>", "<Left>", { desc = "Move left" })
map('i', "<C-l>", "<Right>", { desc = "Move right" })
map('i', "<C-j>", "<Down>", { desc = "Move down" })
map('i', "<C-k>", "<Up>", { desc = "Move up" })

map("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })
-- switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Copy all
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

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
    previous_buf = vim.api.nvim_get_current_buf()
    vim.cmd [[enew]]
end, { desc = "New buffer" })
map("n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })

map("n", "<leader>fm",
    function()
        vim.lsp.buf.format { async = true }
    end,
    { desc = "LSP formatting" }
)

map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("n", "<", "<gv", { desc = "Indent line" })
map("n", ">", ">gv", { desc = "Indent line" })

map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text", silent = true })

-- cycle through buffers
map("n", "<tab>",
    function()
        previous_buf = vim.api.nvim_get_current_buf()
        require("nvchad.tabufline").next()
    end,
    { desc = "Goto next buffer" })


map("n", "<S-tab>",
    function()
        previous_buf = vim.api.nvim_get_current_buf()
        require("nvchad.tabufline").prev()
    end,
    { desc = "Goto prev buffer" })

-- close buffer + hide terminal buffer
map("n", "<leader>x",
    function()
        require("nvchad.tabufline").close_buffer()
    end,
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

map("n", "K",
    function()
        vim.lsp.buf.hover()
    end,
    { desc = "LSP hover" }
)

map("n", "gr",
    function()
        vim.lsp.buf.references()
    end,
    { desc = "LSP references" })


map("n", "<leader>lf",
    function()
        vim.diagnostic.open_float { border = "rounded" }
    end,
    { desc = "Floating diagnostic" })


map("n", "[d",
    function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    { desc = "Goto prev" })


map("n", "]d",
    function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    { desc = "Goto next" }
)

map("n", "<leader>q",
    function()
        vim.diagnostic.setloclist()
    end,
    { desc = "Diagnostic setloclist" })

map("n", "<leader>wa",
    function()
        vim.lsp.buf.add_workspace_folder()
    end,
    { desc = "Add workspace folder" })

map("n", "<leader>wr",
    function()
        vim.lsp.buf.remove_workspace_folder()
    end,
    { desc = "Remove workspace folder" })

map("n", "<leader>wl",
    function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    { desc = "List workspace folders" })

map("v", "<leader>ca",
    function()
        vim.lsp.buf.code_action()
    end,
    { desc = "LSP code action" })

-- toggle
map("n", "<A-f>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
-- focus
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "Focus nvimtree" })

map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

-- git
map("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

-- pick a hidden term
map("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })

-- theme switcher
map("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Nvchad themes" })

map("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" })
-- toggle in terminal mode
map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
-- Do not create new terminal you monster!!
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
        local ok, start = require("indent_blankline.utils").get_current_context(
            vim.g.indent_blankline_context_patterns,
            vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
            vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
            vim.cmd [[normal! _]]
        end
    end,

    { desc = "Jump to current context" }
)

-- Navigation through hunks
map("n", "]c",
    function()
        vim.schedule(function()
            require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
    end,
    { desc = "Jump to next hunk", expr = true }
)

map("n", "[c",
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

map("n", "<leader>ph",
    function()
        require("gitsigns").preview_hunk()
    end,
    { desc = "Preview hunk" })

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
