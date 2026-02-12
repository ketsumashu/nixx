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
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.add_rules({
	-- { を入力して改行したとき、閉じ括弧を }; にする (Nix用)
	Rule("{", "};", "nix")
			:append_pair_if_newline()
	-- すでに後ろに ; がある場合は重複させない判定
			:with_pair(cond.not_after_text(";")),

	-- 特定の単語（let など）の後に = を打ったら ; を自動挿入するなどの応用も可能
	Rule("=", ";", "nix"):with_pair(cond.not_after_text(";")):replace_endpair(function(opts)
		return ""
	end), -- 単純なペアではなく末尾追加用
})
vim.api.nvim_create_user_command("ToggleDefinition", toggle_definition, {})
