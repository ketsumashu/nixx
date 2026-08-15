vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("config.lazy")
require("config.options")
require("config.extra")
require("config.zellij")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
