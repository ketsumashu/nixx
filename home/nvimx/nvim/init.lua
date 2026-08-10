vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "laststatus",
  callback = function()
    vim.schedule(function()
      vim.notify(
        string.format(
          "laststatus: %s -> %s\n%s",
          vim.v.option_old,
          vim.v.option_new,
          debug.traceback()
        )
      )
    end)
  end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("config.lazy")
require("config.extra")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
require("config.options")
