local on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local lua_lsp_settings = {
    Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
            library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
            },
        },
    },
}

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
vim.lsp.config("ts_ls", { init_options = { maxTsServerMemory = 4096 } })
vim.lsp.enable "ts_ls"
vim.lsp.enable "html"
vim.lsp.enable "clangd"
vim.lsp.enable "cssls"
vim.lsp.enable "pyright"
vim.lsp.enable "tailwindcss"
vim.lsp.enable "jdtls"
vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
})
vim.lsp.enable "jsonls"
vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
vim.lsp.enable "lua_ls"
