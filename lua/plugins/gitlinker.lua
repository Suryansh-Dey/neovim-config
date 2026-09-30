return {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  keys = {
    { "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Copy GitHub permalink" },
    { "<leader>go", "<cmd>GitLink! <cr>", mode = { "n", "v" }, desc = "Open GitHub permalink in browser" },
  },
  opts = {},
}

