---@diagnostic disable: undefined-global, lowercase-global
local fn = vim.fn
local o = vim.o
local cmd = vim.cmd


local function lspname()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

local colors = {
    regular0 = "#525566", -- black
    regular1 = "#d59076", -- red
    regular2 = "#5de4c7", -- green
    regular3 = "#b8a161", -- yellow
    regular4 = "#77adb1", -- blue
    regular5 = "#5de4c7", -- magenta
    regular6 = "#77adb1", -- cyan
    regular7 = "#bfbed0", -- white
    bright0 = "#666b7f", -- bright black
    bright1 = "#fead90", -- bright red
    bright2 = "#9dca8c", -- bright green
    bright3 = "#dbc380", -- bright yellow
    bright4 = "#afc5de", -- bright blue
    bright5 = "#cdb6dd", -- bright magenta
    bright6 = "#94cdd1", -- bright cyan
    bright7 = "#f0ecfe", -- bright white
}
local function highlight(group, fg, bg)
    cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

local function filename()
    local name = fn.expand('%:t')
    local filemode = fn.mode()
    local modecolor = {
        n = colors.regular5,
        i = colors.regular4,
        v = colors.regular3,
        V = colors.regular3,
        [''] = colors.regular3,
        c = colors.regular2,
        no = colors.regular1,
        s = colors.regular6,
        S = colors.regular6,
        [''] = colors.regular6,
        ic = colors.bright4,
        R = colors.bright5,
        Rv = colors.bright5,
        cv = colors.bright1,
        ce = colors.bright1,
        r = colors.bright3,
        rm = colors.bright3,
        ['r?'] = colors.bright7,
        ['!'] = colors.bright7,
        t = colors.bright2
    }
    highlight("StatusMode", modecolor[filemode], "NONE")
    highlight("StatusLeft", colors.regular4, "NONE")
    highlight("StatusMid", colors.regular4, "NONE")
    highlight("StatusRight", colors.bright1, "NONE")
    return name
end

function status_line()
    return table.concat {
        "%#StatusMode#",
        filename(),
        "%M",
        "%r",
        "%h",
        "%w",
        "  ",
        "%#StatusLeft#",
        "[%l,%c] of %L",
        "%=",
        "%#StatusMid#",
        "%=",
        "  ",
        "%{&fenc} ",
        "  ",
        "%#StatusRight#",
        "%{&ft}",
        "  ",
        lspname(),
    }
end

o.stl = "%!luaeval('status_line()')"
