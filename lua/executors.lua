return {
    ["javascript"] = function()
        local cmd = "npm start && exit; clear; node " .. vim.fn.expand("%") .. ";exit"
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
    end,

    ["python"] = function()
        local cmd = "python " .. vim.fn.expand("%") .. ";exit"
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
    end,

    ["cpp"] = function()
        local cmd = string.format("g++ %s -o %s && ./%s;exit", vim.fn.expand("%"), vim.fn.expand("%:t:r"),
            vim.fn.expand("%:t:r"))
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
    end,

    ["c"] = function()
        local cmd = string.format("gcc %s -o %s && ./%s;exit", vim.fn.expand("%"), vim.fn.expand("%:t:r"),
            vim.fn.expand("%:t:r"))
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
    end,

    ["rust"] = function()
        local cmd = "cd " .. vim.fn.expand("%:p:h") .. "; cargo run;exit"
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file" })

        local TestCmd = "cd " .. vim.fn.expand("%:p:h") .. "; cargo test;exit"
        vim.keymap.set('n', '<leader>Xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = TestCmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>Xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = TestCmd }
        end, { buffer = true, desc = "Execute current file" })
        vim.keymap.set('n', '<leader>Xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = TestCmd }
        end, { buffer = true, desc = "Execute current file" })
    end
}
