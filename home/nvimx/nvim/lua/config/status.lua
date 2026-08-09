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

local mode_colors = {
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

local function set_highlight(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

local function update_mode_highlight()
  local mode = vim.fn.mode()

  set_highlight("StatusMode", {
    fg = mode_colors[mode] or colors.regular5,
    bg = "NONE",
  })
end

local function setup_highlights()
  set_highlight("StatusRight", {
    fg = colors.bright1,
    bg = "NONE",
  })

  set_highlight("StatusLine", {
    bg = "NONE",
    update = true,
  })

  set_highlight("FloatBorder", {
    bg = "NONE",
    update = true,
  })

  update_mode_highlight()
end

local function lsp_name()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients == 0 then
    return "No Active Lsp"
  end

  return clients[1].name
end

_G.status_line = function()
  return table.concat({
    "%=",
    "  ",
    "%#StatusMode#",
    vim.fn.expand("%:t"),
    "%M%r%h%w",
    "    ",
    "%#StatusRight#",
    "%{&ft}",
    "  ",
    lsp_name(),
  })
end

local augroup = vim.api.nvim_create_augroup("status_line", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = augroup,
  callback = update_mode_highlight,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  callback = setup_highlights,
})

setup_highlights()

vim.opt.statusline = "%!luaeval('status_line()')"
