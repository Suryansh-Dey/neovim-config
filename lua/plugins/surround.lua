return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
        move_cursor = "sticky",
        surrounds = {
            ["("] = {
                add = { "(", ")" },
            },
            ["{"] = {
                add = { "{", "}" },
            },
            ["<"] = {
                add = { "<", ">" },
            },
            ["["] = {
                add = { "[", "]" },
            },
        }
    }
}
