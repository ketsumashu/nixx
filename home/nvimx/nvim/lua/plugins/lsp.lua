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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for name, config in pairs({
        bashls = {},
        lua_ls = {},
        nixd = {
          settings = {
            nixd = {
              formatting = {
                command = { "nixfmt" },
              },
            },
          },
        },
      }) do
        config.capabilities = capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      require("lspsaga").setup({
        beacon = { enable = true },
        implement = { enable = true, sign = false },
        lightbulb = { enable = true, sign = true, virtualText = false },
        outline = { layout = "float" },
        symbolInWinbar = { enable = true },
        ui = { border = "rounded", codeAction = "" },
      })

      pcall(require, "inc_rename")

      require("lint").linters_by_ft = {
        text = {},
        markdown = {},
        nix = { "nix" },
      }
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
