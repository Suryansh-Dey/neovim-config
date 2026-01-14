return {
    window = {
        mappings = {
            ["l"] = "open_and_close",
            ["h"] = "close_node",
            ["s"] = function()
                require("flash").jump()
            end,
            ["S"] = "open_leftabove_vs",
            ["<leader>s"] = "system_open",
        }
    },
    commands = {
        system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
        open_and_close = function(state)
            local node = state.tree:get_node()
            state.commands["open"](state)
            if node.type == "file" then
                vim.cmd 'Neotree close'
            end
        end
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
        }
    },
    default_component_configs = {
        diagnostics = {
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
        }
    }
}
