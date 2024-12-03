local M = {}
local utils = require "core.utils"

M.blankline = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

M.luasnip = function(opts)
  require("luasnip").config.set_config(opts)

  -- vscode format
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

  -- snipmate format
  require("luasnip.loaders.from_snipmate").load()
  require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

  -- lua format
  require("luasnip.loaders.from_lua").load()
  require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
          require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })
end

M.gitsigns = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
  on_attach = function(bufnr)
    utils.load_mappings("gitsigns", { buffer = bufnr })
    local gs = package.loaded.gitsigns

    vim.keymap.set('n', '<leader>j', function()
      if vim.wo.diff then return '<leader>j' end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, { noremap = true, silent = true, buffer = bufnr, desc = "jump bottom git diff" })

    vim.keymap.set('n', '<leader>k', function()
      if vim.wo.diff then return '<leader>k' end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, { noremap = true, silent = true, buffer = bufnr, desc = "jump lower git diff" })

    vim.keymap.set('n', '<leader>ss', gs.stage_hunk,
      { noremap = true, silent = true, buffer = bufnr, desc = "git stage hunk" })
    vim.keymap.set('n', '<leader>sr', gs.reset_hunk,
      { noremap = true, silent = true, buffer = bufnr, desc = "git reset hunk" })
    vim.keymap.set('n', '<leader>sp', gs.preview_hunk,
      { noremap = true, silent = true, buffer = bufnr, desc = "git preview hunk" })
  end,
}

return M
