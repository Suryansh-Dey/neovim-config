return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = { "MasonToolsInstall" },
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "jdtls",
                "typescript-language-server",
                "clangd",
                "html-lsp",
                "css-lsp",
                "pyright",
                "tailwindcss-language-server",
                "lua-language-server",
                "json-lsp"
            },
        },
    },
    {
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        "williamboman/mason.nvim",
        config = true,
    },
}
