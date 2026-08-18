return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
      }
    end,
    init = function()
      vim.cmd("colorscheme poimandres")
    end
  },
}
