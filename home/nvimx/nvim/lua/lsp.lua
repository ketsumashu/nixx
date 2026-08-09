local servers = {
  bashls = {},
  cssls = {},
  lua_ls = {},
  nixd = {},
}

for name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end
