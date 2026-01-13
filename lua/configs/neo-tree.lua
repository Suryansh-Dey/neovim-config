return {
    window = {
        mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["s"] = function()
                require("flash").jump()
            end,
            ["S"] = "open_leftabove_vs",
            ["<leader>s"] = "system_open",
            ["<CR>"] = "open_and_close"
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
            vim.cmd 'Neotree close'
            if node.type == "file" then
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
