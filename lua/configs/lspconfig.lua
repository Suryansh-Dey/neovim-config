vim.lsp.config("ts_ls", { init_options = { maxTsServerMemory = 4096 } })
vim.lsp.enable "ts_ls"
vim.lsp.enable "html"
vim.lsp.enable "clangd"
vim.lsp.enable "cssls"
vim.lsp.enable "pyright"
vim.lsp.enable "tailwindcss"
vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
})
vim.lsp.enable "jsonls"
