return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = {
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = {
                    preview_width = 0.7,
                    results_width = 0.3,
                },
                width = 0.99
            },
            file_ignore_patterns = { "node_modules" }
        },
    }
}
