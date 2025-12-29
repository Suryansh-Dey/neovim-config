return {
    window = {
        mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["s"] = function()
                require("flash").jump()
            end,
            ["S"] = "open_leftabove_vs",
        }
    },
    commands = {
        open_and_close = function(state)
            local node = state.tree:get_node()
            if node.type == "file" then
                require("neo-tree.sources.manager").close_all()
                vim.api.nvim_command("edit " .. node.path)
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
    }
}
