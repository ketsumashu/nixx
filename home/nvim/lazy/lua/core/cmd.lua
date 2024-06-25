---@diagnostic disable: undefined-global

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})
