vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("options")
require("lazy")
require("extra")
require("status")

require("keymaps")
require("autocmds")
require("lsp")
