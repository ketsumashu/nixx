local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "alpha",
    "lir",
    "DressingSelect",
    "",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
    vim.bo.buflisted = false
  end,
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = augroup,
  callback = function()
    vim.cmd("quit")
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = {
    "*.lua",
    "*.nix",
  },
  callback = function()
    vim.lsp.buf.format({
      async = false,
    })
  end,
})
vim.api.nvim_create_autocmd("Progress", {
  group = augroup,
  callback = function(args)
    local data = args.data
    if data.source ~= "nvim" then
      return
    end
    if data.id ~= "bufwrite" then
      return
    end
    if data.status ~= "success" then
      return
    end
    vim.notify(table.concat(data.text, "\n"), vim.log.levels.INFO, {
      title = "Written",
      timeout = 1000,
    })
  end,
})
