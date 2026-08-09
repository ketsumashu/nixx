local function toggle_definition()
  local original_pos = vim.api.nvim_win_get_cursor(0)

  vim.cmd("Lspsaga goto_definition")

  vim.defer_fn(function()
    local new_pos = vim.api.nvim_win_get_cursor(0)

    if original_pos[1] == new_pos[1] and original_pos[2] == new_pos[2] then
      vim.cmd("Lspsaga finder")
    end
  end, 100)
end

vim.api.nvim_create_user_command("ToggleDefinition", toggle_definition, {})
