local map = vim.keymap.set

map("", "<Space>", "<Nop>")

-- Window and split
map("n", "|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "-", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write buffer" })

map("n", "<leader>q", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs <= 1 then
    vim.cmd("quit")
  else
    vim.cmd("Bdelete")
  end
end, { desc = "Delete buffer" })

map("i", "jj", "<Esc>", { desc = "Escape insert mode" })
map("t", "jj", "<C-\\><C-n>", { desc = "Escape terminal mode" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Tabs and buffers
map("n", "[t", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
map("n", "]t", "<cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>[", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>]", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Resize
map("n", "<C-Up>", "<cmd>resize +4<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -4<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize +4<CR>", { desc = "Increase window width" })
map("n", "<C-Right>", "<cmd>vertical resize -4<CR>", { desc = "Decrease window width" })

-- Move lines
map("n", "<A-j>", "<cmd>move .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Search and indent
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Dashboard / explorer
map("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Dashboard" })
map("i", "<C-j>", "<Plug>(skkeleton-toggle)")

map("n", "<leader>e", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd("bdelete!")
  else
    require("telescope").extensions.file_browser.file_browser({ select_buffer = true })
  end
end, { desc = "Explorer" })

-- LSP
map("n", ",B", "<cmd>ToggleDefinition<cr>", { desc = "Go To Definition / Finder" })
map("n", ",b", "<cmd>Lspsaga peek_definition<cr>", { desc = "Definition" })
map("n", "<leader>d", "<cmd>Telescope diagnostics theme=dropdown<cr>", { desc = "Diagnostics" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Previous Diagnostic" })

-- Terminal
map("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "ToggleTerm" })
map("t", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "ToggleTerm" })

-- Folding
map("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "Open All Folds" })
map("n", "zM", function()
  require("ufo").closeAllFolds()
end, { desc = "Close All Folds" })

