local cmp = require "cmp"
return {
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
    init = function()
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "typescript-language-server",
        "clangd",
        "html-lsp",
        "css-lsp",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
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
    opts = function()
      vim.cmd [[
   :hi NvimTreeGitDirty guifg=#ffaa00
   :hi NvimTreeGitStaged guifg=#ffaa00
   :hi NvimTreeGitDeleted guifg=#ff0000
   :hi NvimTreeGitMerge guifg=#00ffff
   :hi NvimTreeGitNew guifg=#00ff00
   :hi NvimTreeGitIgnored guifg=#888888
]]
    end
  }
}
