return function()
    vim.cmd [[
   :hi NvimTreeGitDirty guifg=#ffaa00
   :hi NvimTreeGitStaged guifg=#ffaa00
   :hi NvimTreeGitDeleted guifg=#ff0000
   :hi NvimTreeGitMerge guifg=#00ffff
   :hi NvimTreeGitNew guifg=#00ff00
   :hi NvimTreeGitIgnored guifg=#888888
]]
    local config = require "nvchad.configs.nvimtree"
    config.git = { ignore = false }
    config.on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
            return {
                desc = "nvim-tree: " .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
            }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require("flash").remote() end, opts("Jump cursor"))
        vim.keymap.set("n", "<leader>s", api.node.run.system, opts("Run System"))
        vim.keymap.set('n', "<leader>o", function()
            api.node.open.edit()
            api.tree.close()
        end, opts("Open file and close file tree"))
        --- Oil.nvim who?
        vim.keymap.set({ 'x', 'o' }, "m", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            local start_line = vim.fn.line('v')
            local end_line = vim.fn.line('.')
            for i = start_line, end_line, end_line > start_line and 1 or -1 do
                api.marks.toggle()
                vim.api.nvim_win_set_cursor(0, { i, 0 })
            end
        end, opts("Toggle Bookmark All"))
    end
    return config
end
