{ programs.nixvim.extraConfigLua = ''
  require("bufdel").setup()

  require("nvim-autopairs").setup()

    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
        '                                ',
        '                                ',
        '                                ',
        '                                ',
        '                                ',
        '                                ',
        '                    `ゝ         ',
        '                _／/`           ',
        '              /:; ／            ',
        '          ＿/@,;)ゞ             ',
        '       _/;@ /￣                 ',
        '      /",:;ﾝ                    ',
        '   __/,／       niboshi         ',
        '   `V                           ',
    }
    dashboard.section.buttons.val = {
        dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("e", "File browser", ":Telescope file_browser<CR>"),
        dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
        dashboard.button("s", "Settings", ":cd ~/dotfiles/ | Telescope file_browser<CR>"),
        dashboard.button("u", "update plugins", ":Lazy update<CR>"),
        dashboard.button("q", "Quit NVIM", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  '';
}
