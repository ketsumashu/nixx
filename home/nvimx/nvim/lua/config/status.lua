local api = vim.api

local colors = {
  normal = "#a994b8",
  insert = "#889bb4",
  visual = "#b8a161",
  command = "#83aa74",
  select = "#77adb1",
  replace = "#cdb6dd",
  terminal = "#9dca8c",
  prompt = "#dbc380",
  shell = "#f0ecfe",

  meta = "#fead90",
  progress = "#77adb1",
}

local function setup_highlights()
  api.nvim_set_hl(0, "StatusLine", {
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeNormal", {
    fg = colors.normal,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeInsert", {
    fg = colors.insert,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeVisual", {
    fg = colors.visual,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeCommand", {
    fg = colors.command,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeSelect", {
    fg = colors.select,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeReplace", {
    fg = colors.replace,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeTerminal", {
    fg = colors.terminal,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModePrompt", {
    fg = colors.prompt,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusModeShell", {
    fg = colors.shell,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusMeta", {
    fg = colors.meta,
    bg = "NONE",
  })

  api.nvim_set_hl(0, "StatusProgress", {
    fg = colors.progress,
    bg = "NONE",
  })
end

local function mode_highlight()
  local mode = api.nvim_get_mode().mode

  if mode:sub(1, 1) == "i" then
    return "StatusModeInsert"
  end

  if mode == "v" or mode == "V" or mode == "\22" then
    return "StatusModeVisual"
  end

  if mode:sub(1, 1) == "s" or mode == "S" or mode == "\19" then
    return "StatusModeSelect"
  end

  if mode:sub(1, 1) == "R" then
    return "StatusModeReplace"
  end

  if mode:sub(1, 1) == "c" then
    return "StatusModeCommand"
  end

  if mode:sub(1, 1) == "r" then
    return "StatusModePrompt"
  end

  if mode == "!" then
    return "StatusModeShell"
  end

  if mode:sub(1, 1) == "t" or mode == "nt" then
    return "StatusModeTerminal"
  end

  return "StatusModeNormal"
end

local function status_buffer()
  local winid = tonumber(vim.g.statusline_winid)

  if not winid or winid == 0 or not api.nvim_win_is_valid(winid) then
    winid = api.nvim_get_current_win()
  end

  return api.nvim_win_get_buf(winid)
end

local function escape(text)
  return text:gsub("%%", "%%%%")
end

local function lsp_status(bufnr)
  local clients = vim.lsp.get_clients({
    bufnr = bufnr,
  })

  if #clients == 0 then
    return "No LSP"
  end

  local names = {}

  for _, client in ipairs(clients) do
    names[#names + 1] = client.name
  end

  table.sort(names)

  return table.concat(names, ", ")
end

local function render()
  local bufnr = status_buffer()

  local progress = vim.ui.progress_status():gsub("%s+$", "")
  local diagnostics = vim.diagnostic.status(bufnr)
  local filetype = vim.bo[bufnr].filetype
  local lsp = lsp_status(bufnr)

  local center = ""

  if progress ~= "" then
    center = "%#StatusProgress#" .. progress
  end

  local right = {}

  if diagnostics ~= "" then
    right[#right + 1] = "%#StatusMeta#" .. diagnostics
  end

  if filetype ~= "" then
    right[#right + 1] = "%#StatusMeta#" .. escape(filetype)
  end

  right[#right + 1] = "%#StatusMeta#" .. escape(lsp)

  return table.concat({
    "%#",
    mode_highlight(),
    "# ",
    "%t%M%r%h%w",

    "%=",

    center,

    "%=",

    table.concat(right, "  "),
    " ",
  })
end

local augroup = api.nvim_create_augroup("statusline", {
  clear = true,
})

api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  callback = setup_highlights,
})

setup_highlights()

_G.MashuStatusline = render

vim.opt.statusline = "%!v:lua.MashuStatusline()"
