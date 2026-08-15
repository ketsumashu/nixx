local pane_id = vim.env.ZELLIJ_PANE_ID
local session_name = vim.env.ZELLIJ_SESSION_NAME
local runtime_dir = vim.env.XDG_RUNTIME_DIR

if
  not pane_id
  or pane_id == ""
  or not session_name
  or session_name == ""
  or not runtime_dir
  or runtime_dir == ""
then
  return
end

local safe_session = session_name:gsub("[^A-Za-z0-9_.-]", "_"):sub(1, 32)
local socket = string.format("%s/nvim-zellij-%s-%s.sock", runtime_dir, safe_session, pane_id)

if vim.uv.fs_stat(socket) then
  local connected, channel = pcall(vim.fn.sockconnect, "pipe", socket, { rpc = true })
  if connected and channel > 0 then
    vim.fn.chanclose(channel)
    vim.notify("Zellij Neovim socket is already in use: " .. socket, vim.log.levels.WARN)
    return
  end

  vim.uv.fs_unlink(socket)
end

local started, message = pcall(vim.fn.serverstart, socket)
if not started then
  vim.notify("Failed to start Zellij Neovim socket: " .. message, vim.log.levels.ERROR)
end
