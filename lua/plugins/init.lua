local cmp = require "cmp"
return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "typescript-language-server",
                "clangd",
                "html-lsp",
                "css-lsp",
                "pyright",
            },
        },
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
            require("Comment").setup(opts)
        end,
    },
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        }
    },
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        ft = { 'markdown' },
    },
    {
        "mg979/vim-visual-multi",
        branch = "master",
        event = 'VeryLazy'
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.leap")
        end
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
            require("nvim-surround").setup(
                {
                    keymaps = {
                        normal = "<leader>s",
                        normal_cur = "<leader>ss",
                        normal_line = "<leader>S",
                        normal_cur_line = "<leader>SS",
                        delete = "d<leader>",
                        change = "c<leader>",
                    },
                    move_cursor = "sticky"
                }
            )
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        init = function()
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
            require('cmp').setup.buffer({
                sources = { { name = "crates" } }
            })
            crates.show()
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "nvchad.configs.cmp"
            M.experimental = { ghost_text = true }
            table.insert(M.sources, { name = "crates" })
            M.completion.completeopt = "menu,menuone,noselect"
            M.mapping["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }
            return M
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require("configs.nvim-tree")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "html", "css", "javascript", "json", "cpp", "rust", "markdown", "python" } },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            scope = { char = "┋", highlight = "IblScopeChar" },
        }
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
    }
}
