local fn = vim.fn
local cmd = vim.cmd

local colors = {
  regular0 = "#525566",
  regular1 = "#d59076",
  regular2 = "#83aa74",
  regular3 = "#b8a161",
  regular4 = "#889bb4",
  regular5 = "#a994b8",
  regular6 = "#77adb1",
  regular7 = "#bfbed0",
  bright0 = "#666b7f",
  bright1 = "#fead90",
  bright2 = "#9dca8c",
  bright3 = "#dbc380",
  bright4 = "#afc5de",
  bright5 = "#cdb6dd",
  bright6 = "#94cdd1",
  bright7 = "#f0ecfe",
}

local function lspname()
  local msg = "No Active Lsp"
  local buf_ft = vim.bo.filetype
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if vim.tbl_isempty(clients) then
    return msg
  end

  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end

  return msg
end

local function highlight(group, fg, bg)
  cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

local function filename()
  local name = fn.expand("%:t")
  local filemode = fn.mode()
  local modecolor = {
    n = colors.regular5,
    i = colors.regular4,
    v = colors.regular3,
    V = colors.regular3,
    ["\22"] = colors.regular3,
    c = colors.regular2,
    no = colors.regular1,
    s = colors.regular6,
    S = colors.regular6,
    ["\19"] = colors.regular6,
    ic = colors.bright4,
    R = colors.bright5,
    Rv = colors.bright5,
    cv = colors.bright1,
    ce = colors.bright1,
    r = colors.bright3,
    rm = colors.bright3,
    ["r?"] = colors.bright7,
    ["!"] = colors.bright7,
    t = colors.bright2,
  }

  highlight("StatusMode", modecolor[filemode] or colors.regular5, "NONE")
  highlight("StatusLeft", colors.regular4, "NONE")
  highlight("StatusMid", colors.regular4, "NONE")
  highlight("StatusRight", colors.bright1, "NONE")

  return name
end

_G.status_line = function()
  return table.concat({
    "%=",
    "%#StatusMid#",
    "%=",
    "  ",
    "%#StatusMode#",
    filename(),
    "%M",
    "%r",
    "%h",
    "%w",
    "  ",
    "  ",
    "%#StatusRight#",
    "%{&ft}",
    "  ",
    lspname(),
  })
end

vim.opt.statusline = "%!luaeval('status_line()')"
vim.cmd([[highlight FloatBorder guibg=NONE]])
vim.cmd([[highlight StatusLine guibg=NONE]])
