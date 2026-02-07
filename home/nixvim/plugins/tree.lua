local function open_win_config_func()
        local scr_w = vim.opt.columns:get()
        local scr_h = vim.opt.lines:get()
        local tree_w = 80
        local tree_h = math.floor(tree_w * scr_h / scr_w)
        return {
                border = "double",
                relative = "editor",
                width = tree_w,
                height = tree_h,
                col = (scr_w - tree_w) / 2,
                row = (scr_h - tree_h) / 2,
        }
end
float = {
        enable = true,
        open_win_config = open_win_config_func,
}
