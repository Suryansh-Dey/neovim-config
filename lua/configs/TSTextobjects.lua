return {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "inner class" },
            },
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]M"] = "@function.outer",
                ["]C"] = { query = "@class.outer", desc = "Next class start" },
                ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[c"] = "@class.outer",
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                ["]m"] = "@function.outer",
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[C"] = "@class.outer",
                ["[Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
        }
    },
}
