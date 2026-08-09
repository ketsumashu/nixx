return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvimdev/lspsaga.nvim",
      "nvimtools/none-ls.nvim",
      "mfussenegger/nvim-lint",
      "smjonas/inc-rename.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for name, config in pairs({
        bashls = {},
        cssls = {},
        lua_ls = {},
        nixd = {},
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

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.diagnostics.statix,
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.dotenv_linter,
          null_ls.builtins.diagnostics.deadnix,
          null_ls.builtins.diagnostics.trail_space,
          null_ls.builtins.formatting.nixfmt,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.alejandra,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.prettier,
        },
      })

      require("lint").linters_by_ft = {
        text = {},
        markdown = {},
        nix = { "nix" },
      }
    end,
  },
}
