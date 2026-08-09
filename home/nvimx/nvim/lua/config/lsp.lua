local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({
  "lua_ls",
  "nixd",
  "bashls",
})

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "hl",
        },
      },
    },
  },
})

vim.lspconfig("nixd", {
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})
