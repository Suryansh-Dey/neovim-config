return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local on_init = function(client)
            if client:supports_method "textDocument/semanticTokens" then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end

        local capabilities = require("blink.cmp").get_lsp_capabilities()

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
        vim.lsp.enable "ts_ls"
        vim.lsp.enable "html"
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--completion-style=detailed",
                "--function-arg-placeholders=0",
            }
        })
        vim.lsp.enable "clangd"
        vim.lsp.enable "cssls"
        vim.lsp.enable "pyright"
        vim.lsp.enable "tailwindcss"
        vim.lsp.enable "jdtls"
        vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
        vim.lsp.enable "lua_ls"
        vim.lsp.enable "rust_analyzer"
        vim.lsp.enable "jsonls"

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
        local reported_end = false
        vim.api.nvim_create_autocmd("LspProgress", {
            pattern = 'end',
            callback = function(args)
                if reported_end then return end
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then
                    vim.notify(client.name .. " Ready!", vim.log.levels.INFO)
                    reported_end = true
                end
            end,
        })
        vim.api.nvim_create_autocmd("BufWritePost", {
            callback = function()
                vim.schedule(function()
                    local errors = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }) -
                        #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

                    if errors > 0 then
                        vim.notify(
                            string.format("Found %d error in other files!", errors),
                            vim.log.levels.WARN, { title = "Project ERROR alert" }
                        )
                    end
                end)
            end,
        })

        -- mappings
        local map = vim.keymap.set
        map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search symbols in file", silent = true })
        map("n", "gd", vim.lsp.buf.definition, { desc = "goto definition" })

        map('n', '<leader>fs', function()
            require('telescope.builtin').lsp_workspace_symbols()
        end, { noremap = true, silent = true, desc = "Search symbols in workspace" })
        map("n", "<leader>fd", '<cmd>Telescope diagnostics<CR>', { desc = "Find diagnostics" })
        map("n", "<leader>lf",
            function()
                vim.lsp.buf.format { async = true }
            end,
            { desc = "LSP formatting" })

        map('n', 'H', function()
            vim.lsp.buf.hover({ border = 'rounded' })
        end, { desc = 'LSP documentation' })

        map("n", "<leader>ld",
            function()
                vim.diagnostic.open_float { border = "rounded" }
            end,
            { desc = "Floating diagnostic" })

        map("n", "<leader>ls", function()
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
            { desc = "Goto next" })

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

        map("n", "<leader>s", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Show types and paramenters inline" })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                if client and client.server_capabilities.documentHighlightProvider then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })

                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = ev.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = ev.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp_detach_cleanup", { clear = true }),
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "lsp_document_highlight", buffer = ev.buf })
                        end,
                    })
                end
            end,
        })
    end
}
