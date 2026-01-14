return {
    keymaps = {
        normal = "m",
        normal_cur = "M",
        visual = "m",
        visual_line = "M",
        delete = "md",
        change = "mc",
        normal_line = "Ms", --Don't care
        normal_cur_line = "MSS", --Don't care
        change_line = "MS", --Don't care
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
