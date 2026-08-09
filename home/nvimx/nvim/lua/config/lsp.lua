vim.lsp.enable({
  "lua_ls",
  "nixd",
  "bashls",
})

vim.lsp.config("lua_ls",{
  capabilities = capabilities,
  settings = {
    Lua = {
      diagonistics = {
        globals = { "vim" },
      },
    },
  },
})
