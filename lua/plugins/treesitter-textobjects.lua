return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
        require 'nvim-treesitter.configs'.setup({
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
                        ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next_fold_start" },
                        ["]L"] = { query = { "@loop.outer" } }
                    },
                    goto_previous_start = {
                        ["[f"] = { query = "@function.outer", desc = "Prev function start" },
                        ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                        ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev_fold_start" },
                        ["[l"] = { query = { "@loop.outer" } }
                    },
                    goto_next_end = {
                        ["]f"] = { query = "@function.outer", desc = "Next function end" },
                        ["]c"] = { query = "@class.outer", desc = "Next class end" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next_fold_end" },
                        ["]l"] = { query = { "@loop.outer" } }
                    },
                    goto_previous_end = {
                        ["[F"] = { query = "@function.outer", desc = "Prev function end" },
                        ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                        ["[Z"] = { query = "@fold", query_group = "folds", desc = "Prev_fold_end" },
                        ["[L"] = { query = { "@loop.outer" } }
                    },
                }
            },
        })
    end
}
