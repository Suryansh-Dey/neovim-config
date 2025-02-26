return {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["am"] = { query = "@function.outer", desc = "method outer" },
                ["im"] = { query = "@function.inner", desc = "inner method" },
                ["ac"] = { query = "@class.outer", desc = "class outer" },
                ["ic"] = { query = "@class.inner", desc = "inner class" },
                ["ab"] = { query = "@block.outer", desc = "block outer" },
                ["ib"] = { query = "@block.inner", desc = "inner block" },
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]M"] = { query = "@function.outer", desc = "Next method start" },
                ["]C"] = { query = "@class.outer", desc = "Next class start" },
                ["<leader>J"] = { query = "@local.scope", query_group = "locals", desc = "Next scope start" },
                ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
            },
            goto_previous_start = {
                ["[m"] = { query = "@function.outer", desc = "Prev method start" },
                ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                ["<leader>k"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope start" },
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold start" },
            },
            goto_next_end = {
                ["]m"] = { query = "@function.outer", desc = "Next method end" },
                ["]c"] = { query = "@class.outer", desc = "Next class end" },
                ["<leader>j"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold end" },
            },
            goto_previous_end = {
                ["[M"] = { query = "@function.outer", desc = "Prev method end" },
                ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                ["<leader>K"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope end" },
                ["[Z"] = { query = "@fold", query_group = "folds", desc = "Prev fold end" },
            },
        }
    },
}
