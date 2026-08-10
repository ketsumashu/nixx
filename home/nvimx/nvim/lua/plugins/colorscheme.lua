return {
  {
    "darkvoid-theme/darkvoid.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      glow = true,
      show_end_of_buffer = true,
    },
    config = function(_, opts)
      require("darkvoid").setup(opts)
      vim.env.BAT_THEME = "darkvoid"
      vim.cmd.colorscheme("darkvoid")
    end,
  },
}
