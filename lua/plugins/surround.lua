return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
        keymaps = {
            normal = "m",
            normal_cur = "mm",
            visual = "m",
            visual_line = "mm",
            delete = "md",
            change = "mc",
            normal_line = "mS", --Don't care
            normal_cur_line = "mSS", --Don't care
            change_line = "mS", --Don't care
        },
        move_cursor = "sticky",
        surrounds = {
            ["("] = {
                add = { "(", ")" },
            },
            [")"] = {
                add = { "( ", " )" },
            },
            ["{"] = {
                add = { "{", "}" },
            },
            ["}"] = {
                add = { "{ ", " }" },
            },
            ["<"] = {
                add = { "<", ">" },
            },
            [">"] = {
                add = { "< ", " >" },
            },
            ["["] = {
                add = { "[", "]" },
            },
            ["]"] = {
                add = { "[ ", " ]" },
            },
        }
    }
}
