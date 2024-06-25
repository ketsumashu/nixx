---@diagnostic disable: undefined-global
local options = {
    encoding = "utf-8",
    fileencoding = "utf-8",
    title = false,
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 0,
    laststatus = 3,
    hlsearch = true,
    ignorecase = true,
    showmode = false,
    termguicolors = true,
    smartcase = true,
    smartindent = true,
    swapfile = false,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    backupskip = { "/tmp/*", "/private/tmp/*" },
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = false,
    number = true,
    relativenumber = false,
    mouse = "",
    numberwidth = 2,
    scrolloff = 999,
    splitbelow = true,
    splitright = true,
    shell = "fish"
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
