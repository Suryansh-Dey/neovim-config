return {
    "nvim-tree/nvim-web-devicons",
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require "configs.lspconfig"
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                delete = { text = "󰍵" },
                changedelete = { text = "󱕖" },
            },
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        }
    },
    {
        "suryansh-dey/to-future.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "Saghen/blink.cmp",
        event = { "InsertEnter", "CmdLineEnter" },
        version = '1.*',
        opts = require("configs.blink")
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = { "MasonToolsInstall" },
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "jdtls",
                "typescript-language-server",
                "clangd",
                "html-lsp",
                "css-lsp",
                "pyright",
                "tailwindcss",
                "lua-language-server"
            },
        },
    },
    {
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function(_, opts)
            opts.pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
            require("Comment").setup(opts)
        end,
    },
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            bypass_save_filetypes = { "neo-tree" },
            no_restore_cmds = {
                function()
                    if vim.fn.argc() > 0 then
                        local line = vim.fn.line "'\""
                        if line > 1 and line <= vim.fn.line "$" then
                            vim.cmd 'normal! g`"'
                        end
                    end
                end
            }
        }
    },
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        ft = { 'markdown' },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            search = {
                multi_window = false,
            },
            jump = {
                nohlsearch = true,
            },
            modes = {
                char = {
                    enabled = false,
                }
            },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Jump cursor" },
            { "m", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("configs.treesitter_context")
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup(require "configs.nvim-surround")
        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = "neovim/nvim-lspconfig",
        ft = "rust",
        opts = function()
            return require "configs.rust-tools"
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end
    },
    {
        'saecki/crates.nvim',
        ft = { "toml" },
        tag = 'stable',
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        opts = require("configs.neo-tree")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "html", "css", "javascript", "tsx", "typescript", "json", "cpp", "rust", "markdown", "python", "java" } },
    },
    {
        "b0o/schemastore.nvim",
        ensure_installed = { "vscode-json-languageserver" }
    },
    {
        "AckslD/nvim-neoclip.lua",
        event = 'TextYankPost',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('neoclip').setup()
        end,
    },
    {

        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                file_ignore_patterns = { "node_modules" }
            }
        }
    },
    {
        "folke/which-key.nvim",
        ft = { 'text', "markdown" },
        keys = { "z=", "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require 'nvim-treesitter.configs'.setup(require("configs.TSTextobjects"))
        end
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = { enable_autocmd = false }
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        event = "VeryLazy",
        config = function()
            require("configs.multicursor")
        end
    }
}
