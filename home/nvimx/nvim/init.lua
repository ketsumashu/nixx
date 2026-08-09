vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("config.lazy")
require("config.options")
require("config.extra")
--require("config.status")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
