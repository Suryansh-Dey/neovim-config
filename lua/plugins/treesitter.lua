return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "html", "css", "javascript", "tsx", "typescript", "json", "cpp", "rust", "markdown", "python", "java", "lua", "luadoc", "printf", "vim", "vimdoc" },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        })
    end
}
