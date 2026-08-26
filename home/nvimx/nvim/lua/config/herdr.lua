local pane_id = vim.env.HERDR_PANE_ID
local runtime_dir = vim.env.XDG_RUNTIME_DIR

if vim.env.HERDR_ENV ~= "1" or not pane_id or pane_id == "" or not runtime_dir or runtime_dir == "" then
  return
end

local safe_pane_id = pane_id:gsub("[^A-Za-z0-9_.-]", "_"):sub(1, 64)
local socket = string.format("%s/nvim-herdr-%s.sock", runtime_dir, safe_pane_id)

if vim.uv.fs_stat(socket) then
  local connected, channel = pcall(vim.fn.sockconnect, "pipe", socket, { rpc = true })
  if connected and channel > 0 then
    vim.fn.chanclose(channel)
    vim.notify("Herdr Neovim socket is already in use: " .. socket, vim.log.levels.WARN)
    return
  end

  vim.uv.fs_unlink(socket)
end

local started, message = pcall(vim.fn.serverstart, socket)
if not started then
  vim.notify("Failed to start Herdr Neovim socket: " .. message, vim.log.levels.ERROR)
end
