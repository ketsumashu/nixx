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

--autopairにてBracketの後にセミコロンが来るようにする
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.add_rules({
	Rule("{", "};", "nix"):with_pair(cond.not_after_regex("%;")),
})
vim.api.nvim_create_user_command("ToggleDefinition", toggle_definition, {})
