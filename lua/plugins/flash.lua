return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        highlight = { backdrop = false },
        search = { multi_window = false },
        jump = { nohlsearch = true },
        modes = { char = { enabled = false } },
    },
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Jump cursor" },
        { "m", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
    },
}
