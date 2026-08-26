vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("config.options")
require("config.lazy")
require("config.extra")
require("config.herdr")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
