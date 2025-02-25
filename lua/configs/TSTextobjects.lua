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
                ["]M"] = { query = "@function.outer", desc = "Next function start" },
                ["]C"] = { query = "@class.outer", desc = "Next class start" },
                ["]Z"] = { query = "@local.scope", query_group = "locals", desc = "Next scope start" },
            },
            goto_previous_start = {
                ["[m"] = { query = "@function.outer", desc = "Prev function start" },
                ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                ["[z"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope start" },
            },
            goto_next_end = {
                ["]m"] = { desc = "@function.outer", query = "Next function end" },
                ["]c"] = { query = "@class.outer", desc = "Next class end" },
                ["]z"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
            },
            goto_previous_end = {
                ["[M"] = { query = "@function.outer", desc = "Prev function end" },
                ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                ["[Z"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
            },
        }
    },
}
