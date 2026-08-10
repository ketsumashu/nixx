return {
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "forest",
      transparent = true,
      terminal = true,

      styles = {
        keywords = { italic = false, bold = true },
        comments = { italic = false, bold = true },
        strings = { italic = false, bold = true },
      }
    },
    config = function(_, opts)
      require("thorn").setup(opts)
      vim.env.BAT_THEME = "thorn"
      vim.cmd.colorscheme("thorn")
    end,
  },
}
