return {
  {
    "kvrohit/substrata.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("substrata").setup()
      vim.g.substrata_italic_comments = false
      vim.g.transparent = true
      vim.cmd.colorscheme("substrata")
    end,
  },
}
