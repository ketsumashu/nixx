vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

require("options")
require("lazy")
require("extra")
require("status")

require("keymaps")
require("autocmds")
require("lsp")
