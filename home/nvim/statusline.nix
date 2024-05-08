{
  programs.nixvim.plugins.lualine.enable = true;
#  programs.nixvim.extraConfigLua = ''
#    ---@diagnostic disable: undefined-global, lowercase-global
#    local fn = vim.fn
#    local o = vim.o
#    local cmd = vim.cmd
#
#
#    local function lspname()
#        local msg = 'No Active Lsp'
#        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
#        local clients = vim.lsp.get_active_clients()
#        if next(clients) == nil then return msg end
#        for _, client in ipairs(clients) do
#            local filetypes = client.config.filetypes
#            if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
#                return client.name
#            end
#        end
#        return msg
#    end
#
#    local colors = {
#        regular0 = "#1b1c28", -- black
#        regular1 = "#d0679d", -- red
#        regular2 = "#5de4c7", -- green
#        regular3 = "#fffac2", -- yellow
#        regular4 = "#89ddff", -- blue
#        regular5 = "#fcc5e9", -- magenta
#        regular6 = "#add7ff", -- cyan
#        regular7 = "#ffffff", -- white
#        bright0 = "#a6accd", -- bright black
#        bright1 = "#d0679d", -- bright red
#        bright2 = "#5de4c7", -- bright green
#        bright3 = "#fffac2", -- bright yellow
#        bright4 = "#add7ff", -- bright blue
#        bright5 = "#fae4fc", -- bright magenta
#        bright6 = "#89ddff", -- bright cyan
#        bright7 = "#ffffff", -- bright white
#    }
#    local function highlight(group, fg, bg)
#        cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
#    end
#
#    local function filename()
#        local name = fn.expand('%:t')
#        local filemode = fn.mode()
#        local modecolor = {
#            n = colors.regular2,
#            i = colors.regular4,
#            v = colors.regular6,
#            V = colors.regular6,
#            [''] = colors.regular3,
#            c = colors.regular2,
#            no = colors.regular1,
#            s = colors.regular6,
#            S = colors.regular6,
#            [''] = colors.regular6,
#            ic = colors.bright4,
#            R = colors.bright5,
#            Rv = colors.bright5,
#            cv = colors.bright1,
#            ce = colors.bright1,
#            r = colors.bright3,
#            rm = colors.bright3,
#            ['r?'] = colors.bright7,
#            ['!'] = colors.bright7,
#            t = colors.bright2
#        }
#        highlight("StatusMode", modecolor[filemode], "NONE")
#        highlight("StatusLeft", colors.regular4, "NONE")
#        highlight("StatusMid", colors.regular4, "NONE")
#        highlight("StatusRight", colors.bright1, "NONE")
#        return name
#    end
#
#    function status_line()
#        return table.concat {
#            "%#StatusMode#",
#            filename(),
#            "%M",
#            "%r",
#            "%h",
#            "%w",
#            "  ",
#            "%#StatusLeft#",
#            "[%l,%c] of %L",
#            "%=",
#            "%#StatusMid#",
#            "%=",
#            "  ",
#            "%{&fenc} ",
#            "  ",
#            "%#StatusRight#",
#            "%{&ft}",
#            "  ",
#            lspname(),
#        }
#    end
#
#    o.stl = "%!luaeval('status_line()')"
#  '';
}
