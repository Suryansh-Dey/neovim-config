local cmp = require "cmp"
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
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
        "codelldb"
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
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "configs.rustaceanvim"
    end
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    keys = {
      { "<M-b>", "<cmd> DapToggleBreakpoint <CR>",          desc = "Set break point" },
      { "<M-c>", function() require('dap').continue() end,  desc = "Debugger continue" },
      { "<M-n>", function() require('dap').step_over() end, desc = "Debugger step_over" },
      { "<M-d>", function() require('dap').step_into() end, desc = "Debugger step_into" },
      { "<M-o>", function() require('dap').step_out() end,  desc = "Debugger step_out" },
      { "<M-x>", function() require('dap').terminate() end, desc = "Debugger terminate" }
    },
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {}
    }
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" } }
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
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
