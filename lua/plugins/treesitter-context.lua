return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = math.floor(vim.api.nvim_win_get_height(0) * 0.3),
            trim_scope = "outer",
            min_window_height = 0,
            mode = "topline",
            separator = nil,
        })
        vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "Grey" })
        vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { underline = true, sp = "Grey" })
    end,
}
