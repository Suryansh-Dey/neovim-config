return {
    window = {
        mappings = {
            ["<leader>o"] = "open_and_close",
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
    }
}
