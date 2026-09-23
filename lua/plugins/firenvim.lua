if vim.g.started_by_firenvim then
    vim.o.laststatus = 0
    vim.o.guifont = "monospace:h14"
    vim.opt.swapfile = false
    vim.opt.shadafile = "NONE"
    vim.opt.report = 999999
    -- Put in insert mode if empty
    vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
        callback = function()
            if vim.bo.filetype ~= "markdown" then return end

            local line_count = vim.api.nvim_buf_line_count(0)
            local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)

            if (line_count == 1 and #lines[1] == 0) or (line_count == 2 and #lines[1] == 0 and #lines[2] == 0) then
                vim.cmd("startinsert")
            end
        end
    })
end
if vim.g.started_by_firenvim then
    CREATE_FILE_IF_MISSING("/tmp/.clang-format", [[BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never]])
end

vim.g.firenvim_config = {
    globalSettings = {
        ignoreKeys = {
            all = { '<C-r>', '<C-l>', '<C-f>' }
        }
    },
    localSettings = {
        ['.*'] = {
            filename = '/tmp/{hostname}_{pathname%10}.md',
            cmdline = 'neovim'
        },
        ['https?://(www\\.)?(leetcode\\.com|geeksforgeeks\\.org)/.*'] = {
            filename = '/tmp/{hostname}_{pathname%10}.cpp',
            cmdline = 'neovim'
        },
        ['https?://web\\.whatsapp\\.com/.*'] = { takeover = 'never', priority = 1 }
    }
}
return {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end
}
