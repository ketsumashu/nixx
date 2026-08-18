return {
  {
    "kvrohit/substrata.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.substrata_italic_comments = false
      vim.cmd.colorscheme("substrata")
      vim.g.transparent = true
    end,
  },
}
