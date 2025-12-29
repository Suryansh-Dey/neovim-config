local key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
return {
    appearance = { nerd_font_variant = "normal" },
    fuzzy = { implementation = "prefer_rust" },
    sources = { default = { "lsp", "snippets", "buffer", "path" } },
    keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "snippet_forward", function()
            vim.api.nvim_feedkeys(key, "n", false)
        end },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" }
    },
    cmdline = {
        enabled = true,
        completion = {
            menu = { auto_show = true },
            list = { selection = { preselect = false, auto_insert = true } }
        },
    },
    completion = {
        ghost_text = { enabled = true },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = { border = "single" },
        },
    }
}
