return {
    window = {
        mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["s"] = function()
                require("flash").jump()
            end,
            ["S"] = "open_leftabove_vs",
            ["<leader>s"] = "system_open"
        }
    },
    commands = {
        system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
        }
    }
}
