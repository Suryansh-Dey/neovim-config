return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
            move = {
                set_jumps = true,
            },
        })

        local ts_select = require("nvim-treesitter-textobjects.select")
        local ts_move = require("nvim-treesitter-textobjects.move")

        -- Select mapping helper
        local select_maps = {
            ["af"] = { "@function.outer", "function outer" },
            ["if"] = { "@function.inner", "inner function" },
            ["ac"] = { "@class.outer", "class outer" },
            ["ic"] = { "@class.inner", "inner class" },
            ["al"] = { "@block.outer", "block outer" },
            ["il"] = { "@block.inner", "inner block" },
        }
        for map, val in pairs(select_maps) do
            vim.keymap.set({ "x", "o" }, map, function() ts_select.select_textobject(val[1], "textobjects") end,
                { desc = val[2] })
        end

        -- Move mappings
        -- Next start
        vim.keymap.set({ "n", "x", "o" }, "]F", function()
            SET_JUMP_CMD("]F", "[f")
            ts_move.goto_next_start("@function.outer", "textobjects")
        end, { desc = "Next function start" })
        vim.keymap.set({ "n", "x", "o" }, "]C", function()
            SET_JUMP_CMD("]C", "[c")
            ts_move.goto_next_start("@class.outer", "textobjects")
        end, { desc = "Next class start" })
        vim.keymap.set({ "n", "x", "o" }, "]Z", function()
            SET_JUMP_CMD("]Z", "[z")
            ts_move.goto_next_start("@fold", "folds")
        end, { desc = "Next fold start" })
        vim.keymap.set({ "n", "x", "o" }, "]L", function()
            SET_JUMP_CMD("]L", "[l")
            ts_move.goto_next_start({ "@loop.outer" }, "textobjects")
        end, { desc = "Next loop start" })

        -- Prev start
        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            SET_JUMP_CMD("]F", "[f")
            ts_move.goto_previous_start("@function.outer", "textobjects")
        end, { desc = "Prev function start" })
        vim.keymap.set({ "n", "x", "o" }, "[c", function()
            SET_JUMP_CMD("]C", "[c")
            ts_move.goto_previous_start("@class.outer", "textobjects")
        end, { desc = "Prev class start" })
        vim.keymap.set({ "n", "x", "o" }, "[z", function()
            SET_JUMP_CMD("]Z", "[z")
            ts_move.goto_previous_start("@fold", "folds")
        end, { desc = "Prev fold start" })
        vim.keymap.set({ "n", "x", "o" }, "[l", function()
            SET_JUMP_CMD("]L", "[l")
            ts_move.goto_previous_start({ "@loop.outer" }, "textobjects")
        end, { desc = "Prev loop start" })

        -- Next end
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
                SET_JUMP_CMD("]f", "[F")
                ts_move.goto_next_end("@function.outer", "textobjects")
            end,
            { desc = "Next function end" })
        vim.keymap.set({ "n", "x", "o" }, "]c", function()
                SET_JUMP_CMD("]c", "[C")
                ts_move.goto_next_end("@class.outer", "textobjects")
            end,
            { desc = "Next class end" })
        vim.keymap.set({ "n", "x", "o" }, "]z", function()
                SET_JUMP_CMD("]z", "[Z")
                ts_move.goto_next_end("@fold", "folds")
            end,
            { desc = "Next fold end" })
        vim.keymap.set({ "n", "x", "o" }, "]l", function()
                SET_JUMP_CMD("]l", "[L")
                ts_move.goto_next_end({ "@loop.outer" }, "textobjects")
            end,
            { desc = "Next loop end" })

        -- Prev end
        vim.keymap.set({ "n", "x", "o" }, "[F",
            function()
                SET_JUMP_CMD("]f", "[F")
                ts_move.goto_previous_end("@function.outer", "textobjects")
            end, { desc = "Prev function end" })
        vim.keymap.set({ "n", "x", "o" }, "[C", function()
                SET_JUMP_CMD("]c", "[C")
                ts_move.goto_previous_end("@class.outer", "textobjects")
            end,
            { desc = "Prev class end" })
        vim.keymap.set({ "n", "x", "o" }, "[Z", function()
                SET_JUMP_CMD("]z", "[Z")
                ts_move.goto_previous_end("@fold", "folds")
            end,
            { desc = "Prev fold end" })
        vim.keymap.set({ "n", "x", "o" }, "[L",
            function()
                SET_JUMP_CMD("]l", "[L")
                ts_move.goto_previous_end({ "@loop.outer" }, "textobjects")
            end, { desc = "Prev loop end" })
    end
}
