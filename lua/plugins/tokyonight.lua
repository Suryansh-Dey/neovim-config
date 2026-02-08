return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_highlights = function(hl, c)
            hl.Substitute = { bg = c.cyan, fg = c.black }
            hl.FlashLabel = { bg = c.cyan, fg = c.black }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd([[colorscheme tokyonight-night]])
    end
}
