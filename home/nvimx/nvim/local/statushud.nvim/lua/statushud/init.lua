local M = {}

local api = vim.api

local config = {
  margin_right = 2,
  margin_bottom = 1,
}

local state = {
  buf = nil,
  win = nil,
}

local function valid_buffer()
  return state.buf and api.nvim_buf_is_valid(state.buf)
end

local function valid_window()
  return state.win and api.nvim_win_is_valid(state.win)
end

local function setup_highlights()
  api.nvim_set_hl(0, "HudFilename", {
    fg = "#a994b8",
    bg = "NONE",
  })

  api.nvim_set_hl(0, "HudMeta", {
    fg = "#fead90",
    bg = "NONE",
  })

  api.nvim_set_hl(0, "HudNormal", {
    bg = "NONE",
  })
end

local function ensure_buffer()
  if valid_buffer() then
    return
  end

  state.buf = api.nvim_create_buf(false, true)

  vim.bo[state.buf].bufhidden = "wipe"
  vim.bo[state.buf].buftype = "nofile"
  vim.bo[state.buf].swapfile = false
end

local function filename()
  local bufnr = api.nvim_get_current_buf()
  local name = api.nvim_buf_get_name(bufnr)

  if name == "" then
    return "[No Name]"
  end

  return vim.fn.fnamemodify(name, ":t")
end

local function filetype()
  local ft = vim.bo.filetype

  if ft == "" then
    return "unknown"
  end

  return ft
end

local function lsp()
  local clients = vim.lsp.get_clients({
    bufnr = api.nvim_get_current_buf(),
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

local function contents()
  return {
    filename(),
    string.format("%s  %s", filetype(), lsp()),
  }
end

local function display_width(lines)
  local width = 1

  for _, line in ipairs(lines) do
    width = math.max(
      width,
      vim.fn.strdisplaywidth(line)
    )
  end

  return width
end

local function window_config(width)
  return {
    relative = "editor",

    row = vim.o.lines - 3 - config.margin_bottom,
    col = vim.o.columns - width - config.margin_right,

    width = width,
    height = 2,

    anchor = "NW",

    focusable = false,
    mouse = false,

    style = "minimal",
    border = "none",

    zindex = 40,
  }
end

local function ensure_window(width)
  ensure_buffer()

  if valid_window() then
    api.nvim_win_set_config(
      state.win,
      window_config(width)
    )

    return
  end

  state.win = api.nvim_open_win(
    state.buf,
    false,
    window_config(width)
  )

  vim.wo[state.win].winhighlight =
  "Normal:HudNormal"

  vim.wo[state.win].wrap = false
end

function M.render()
  local lines = contents()
  local width = display_width(lines)

  ensure_window(width)

  vim.bo[state.buf].modifiable = true

  api.nvim_buf_set_lines(
    state.buf,
    0,
    -1,
    false,
    lines
  )

  api.nvim_buf_clear_namespace(
    state.buf,
    -1,
    0,
    -1
  )

  api.nvim_buf_add_highlight(
    state.buf,
    -1,
    "HudFilename",
    0,
    0,
    -1
  )

  api.nvim_buf_add_highlight(
    state.buf,
    -1,
    "HudMeta",
    1,
    0,
    -1
  )

  vim.bo[state.buf].modifiable = false
end

function M.hide()
  if valid_window() then
    api.nvim_win_close(state.win, true)
  end

  state.win = nil
end

function M.setup(opts)
  config = vim.tbl_deep_extend(
    "force",
    config,
    opts or {}
  )

  setup_highlights()

  local group = api.nvim_create_augroup(
    "statushud",
    { clear = true }
  )

  api.nvim_create_autocmd({
    "BufEnter",
    "BufFilePost",
    "BufModifiedSet",
    "FileType",
    "WinEnter",
    "LspAttach",
    "LspDetach",
    "VimResized",
    "WinResized",
  }, {
    group = group,
    callback = function()
      vim.schedule(M.render)
    end,
  })

  api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = function()
      setup_highlights()
      M.render()
    end,
  })

  M.render()
end

return M
