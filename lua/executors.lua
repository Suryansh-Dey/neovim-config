local function execute_terminal(cmd)
    cmd = cmd .. ";exit"
    vim.keymap.set('n', '<leader>Xi', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "float", id = "floatTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute current file in full screen terminal" })
    vim.keymap.set('n', '<leader>Xv', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute current file in vertical terminal" })
    vim.keymap.set('n', '<leader>Xh', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute current file in horizontal terminal" })
end

local function execute_terminal_test(cmd)
    cmd = cmd .. ";exit"
    vim.keymap.set('n', '<leader>xi', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "float", id = "floatTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute tests in full screen terminal" })
    vim.keymap.set('n', '<leader>xv', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute tests in vertical terminal" })
    vim.keymap.set('n', '<leader>xh', function()
        vim.cmd('w')
        require("configs.nvterm").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
    end, { buffer = true, desc = "Execute tests in horizontal terminal" })
end

return {
    ["javascript,typescript"] = function()
        local cmd = "node " .. vim.fn.expand("%")
        execute_terminal(cmd)
    end,

    ["python"] = function()
        local cmd = "python " .. vim.fn.expand("%")
        execute_terminal(cmd)
    end,

    ["cpp"] = function()
        local filename = vim.fn.expand("%")
        local debug_flags =
        "-std=c++17 -Wall -Wextra -Wshadow -g -O0 -D_GLIBCXX_DEBUG -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -pipe"
        local debug_outname = "/tmp/nvim_cpp_compile"
        local debug_compile = string.format("g++ %s %s -o %s", debug_flags, filename, debug_outname)
        local debug_cmd = string.format("%s && %s", debug_compile, debug_outname)
        local debug_test_cmd = debug_cmd .. " < input.txt"

        if vim.fn.filereadable("output.txt") then
            debug_test_cmd = debug_test_cmd.." | cp_test output.txt"
        end

        execute_terminal(debug_cmd)
        execute_terminal_test(debug_test_cmd)
    end,

    ["c"] = function()
        local cmd = string.format("gcc %s -o %s && ./%s", vim.fn.expand("%"), vim.fn.expand("%:t:r"),
            vim.fn.expand("%:t:r"))
        execute_terminal(cmd)
    end,

    ["rust"] = function()
        local cmd = "cd " .. vim.fn.expand("%:p:h") .. "; cargo run " .. vim.fn.expand("%")
        execute_terminal(cmd)

        local test_cmd = "cd " .. vim.fn.expand("%:p:h") .. "; cargo test -- --nocapture"
        execute_terminal_test(test_cmd)
    end,
    ["html"] = function()
        local cmd = "cd " .. vim.fn.expand("%:p:h") .. "&&live-server"
        execute_terminal(cmd)
    end,
    ["java"] = function()
        local cmd = string.format("java %s", vim.fn.expand("%"))
        execute_terminal(cmd)
    end
}
