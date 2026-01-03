local lspconfig = require("configs.lspconfig")
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

vim.lsp.config("*", { capabilities = lspconfig.capabilities, on_init = lspconfig.on_init })
vim.lsp.config("ts_ls", { init_options = { maxTsServerMemory = 4096 } })
vim.lsp.enable "ts_ls"
vim.lsp.enable "html"
vim.lsp.config("clangd", { cmd = { "clangd", "--function-arg-placeholders=0" } })
vim.lsp.enable "clangd"
vim.lsp.enable "cssls"
vim.lsp.enable "pyright"
vim.lsp.enable "tailwindcss"
vim.lsp.enable "jdtls"
vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
vim.lsp.enable "lua_ls"

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = '●',
        severity_sort = true,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

local reported = false
vim.api.nvim_create_autocmd("LspProgress", {
    pattern = 'report',
    callback = function(args)
        if reported then return end
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            vim.notify(client.name .. " Preparing..", vim.log.levels.INFO)
            reported = true
        end
    end
})
vim.api.nvim_create_autocmd("LspProgress", {
    pattern = 'end',
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            vim.notify(client.name .. " Ready!", vim.log.levels.INFO)
        end
    end,
})

-- mappings
local map = vim.keymap.set
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file", silent = true })
map('n', '<leader>fs', function()
    require('telescope.builtin').lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Search symbols in workspace" }
)

map("n", "<leader>fm",
    function()
        vim.lsp.buf.format { async = true }
    end,
    { desc = "LSP formatting" }
)

map('n', 'K', function()
    vim.lsp.buf.hover({ border = 'rounded' })
end, { desc = 'LSP documentation' })

map("n", "<leader>lf",
    function()
        vim.diagnostic.open_float { border = "rounded" }
    end,
    { desc = "Floating diagnostic" })

map("n", "<leader>sh", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
end, { desc = "Signature help" })

map("n", "[d",
    function()
        vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
    end,
    { desc = "Goto prev" })


map("n", "]d",
    function()
        vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
    end,
    { desc = "Goto next" }
)

map("n", "<leader>lq",
    function()
        vim.diagnostic.setloclist()
    end,
    { desc = "Diagnostic setloclist" })

map("n", "<leader>wa",
    function()
        vim.lsp.buf.add_workspace_folder()
    end,
    { desc = "Add workspace folder" })

map("n", "<leader>wr",
    function()
        vim.lsp.buf.remove_workspace_folder()
    end,
    { desc = "Remove workspace folder" })

map("n", "<leader>wl",
    function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    { desc = "List workspace folders" })
