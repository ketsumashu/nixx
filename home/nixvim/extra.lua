local function toggle_definition()
	-- Store the original cursor position
	local original_pos = vim.api.nvim_win_get_cursor(0)

	-- Attempt to jump to the definition
	vim.cmd("Lspsaga goto_definition")

	-- Small delay to allow command to process; adjust as necessary
	vim.defer_fn(function()
		-- Get the new cursor position
		local new_pos = vim.api.nvim_win_get_cursor(0)

		-- Compare positions (line and column)
		if original_pos[1] == new_pos[1] and original_pos[2] == new_pos[2] then
			-- If the cursor hasn't moved, call finder
			vim.cmd("Lspsaga finder")
		end
	end, 100) -- Delay time in milliseconds
end

vim.api.nvim_create_user_command("ToggleDefinition", toggle_definition, {})

local highlights = {
	NavicIconsDefault = { bg = "NONE" },
	NavicText = { bg = "NONE" },
	NavicSeparator = { bg = "NONE" },
	BufferLineFill = { bg = "#131313" },
	BufferLineBackground = { bg = "#131313" },
	BufferLineCloseButton = { bg = "#131313" },
	BufferLineCloseButtonSelected = { bg = "#131313" },
	BufferLineCloseButtonVisible = { bg = "#131313" },
	BufferLineCloseDeviconLuaInactive = { bg = "#131313" },
	BufferLineCloseDeviconLuaSelected = { bg = "#131313" },
	BufferLineBufferSelected = { fg = "#5fdbba", bg = "#131313" },
	BufferLineSeparator = { fg = "#131313", bg = "#131313" },
	BufferLineSeparatorVisible = { fg = "#131313", bg = "#131313" },
	BufferLineOffsetSeparator = { fg = "#131313", bg = "#131313" },
}

for group, settings in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, settings)
end
