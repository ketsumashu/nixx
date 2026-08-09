return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
      disable_float_background = true,
      disable_italics = true,
    },
    config = function(_, opts)
      require("poimandres").setup(opts)
      vim.env.BAT_THEME = "poimandres"
      vim.cmd.colorscheme("poimandres")
    end,
  },
}
