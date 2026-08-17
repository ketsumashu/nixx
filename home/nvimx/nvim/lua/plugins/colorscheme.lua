return {
  {
    "ThorstenRhau/token",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      dim_inactive = false,
      attributes = {
        italic = false,
      }
    },
    config = function(_, opts)
      require("token").setup(opts)
      vim.env.BAT_THEME = "token-temper"
      vim.cmd.colorscheme("token-temper")
    end,
  },
}
