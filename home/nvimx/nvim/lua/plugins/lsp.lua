return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimdev/lspsaga.nvim",
      "mfussenegger/nvim-lint",
      "smjonas/inc-rename.nvim",
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
