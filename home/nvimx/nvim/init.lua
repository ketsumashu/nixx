vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "laststatus",
	callback = function()
		local message = string.format(
			"\nlaststatus: %s -> %s\n%s\n",
			vim.v.option_old,
			vim.v.option_new,
			debug.traceback()
		)

		vim.fn.writefile(
			vim.split(message, "\n"),
			"/tmp/laststatus.log",
			"a"
		)
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
