vim.lsp.enable({
  "lua_ls",
  "nixd",
  "bashls",
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "hl",
          "blink.cmp",
        },
      },
    },
  },
})

vim.lsp.config("nixd", {
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})
