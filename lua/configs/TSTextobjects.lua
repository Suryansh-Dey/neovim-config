return {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "function outer" },
                ["if"] = { query = "@function.inner", desc = "inner function" },
                ["ac"] = { query = "@class.outer", desc = "class outer" },
                ["ic"] = { query = "@class.inner", desc = "inner class" },
                ["al"] = { query = "@block.outer", desc = "block outer" },
                ["il"] = { query = "@block.inner", desc = "inner block" },
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]F"] = { query = "@function.outer", desc = "Next function start" },
                ["]C"] = { query = "@class.outer", desc = "Next class start" },
                ["<leader>J"] = { query = "@local.scope", query_group = "locals", desc = "Next scope start" },
                ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
            },
            goto_previous_start = {
                ["[f"] = { query = "@function.outer", desc = "Prev function start" },
                ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                ["<leader>k"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope start" },
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold start" },
            },
            goto_next_end = {
                ["]f"] = { query = "@function.outer", desc = "Next function end" },
                ["]c"] = { query = "@class.outer", desc = "Next class end" },
                ["<leader>j"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold end" },
            },
            goto_previous_end = {
                ["[F"] = { query = "@function.outer", desc = "Prev function end" },
                ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                ["<leader>K"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope end" },
                ["[Z"] = { query = "@fold", query_group = "folds", desc = "Prev fold end" },
            },
        }
    },
}
