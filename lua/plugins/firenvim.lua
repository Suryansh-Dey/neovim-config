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
