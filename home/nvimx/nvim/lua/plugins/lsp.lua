return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvimdev/lspsaga.nvim",
      "mfussenegger/nvim-lint",
      "smjonas/inc-rename.nvim",
    },
    config = function()
      require("lspsaga").setup({
        beacon = { enable = true },
        implement = { enable = true, sign = false },
        lightbulb = { enable = true, sign = true, virtualText = false },
        outline = { layout = "float" },
        symbolInWinbar = { enable = true },
        ui = { border = "rounded", codeAction = "" },
      })
    end,
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
