return {
  {
    "kvrohit/substrata.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.substrata_italic_comments = false
      vim.g.transparent = true
      vim.cmd.colorscheme("substrata")
    end,
  },
}
