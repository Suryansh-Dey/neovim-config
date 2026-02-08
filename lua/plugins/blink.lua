return {
    "Saghen/blink.cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    version = '1.*',
    opts = {
        appearance = { nerd_font_variant = "normal" },
        fuzzy = { implementation = "prefer_rust" },
        sources = { default = { "lsp", "snippets", "buffer", "path" } },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "snippet_forward", function(cmp)
                if cmp.is_menu_visible() then
                    return cmp.select_next()
                else
                    return cmp.show()
                end
            end },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            ['<CR>'] = {
                function(cmp)
                    if not cmp.is_visible() then return end
                    local items = cmp.get_items();
                    if not cmp.is_menu_visible() and
                        (vim.bo.filetype ~= 'cpp' or (items[1].additionalTextEdits and #items[1].additionalTextEdits > 0))
                        and #items > 1 and (items[1].label == items[2].label or (#items > 2 and items[1].label == items[3].label)) then
                        return cmp.show()
                    end
                    return cmp.accept()
                end,
                'fallback',
            },
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
            menu = { auto_show = false },
        },
        signature = {
            enabled = true,
            window = {
                border = 'rounded',
            }
        },
    }
}
