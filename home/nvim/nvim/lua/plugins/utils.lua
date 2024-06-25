return {
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup()
        end,
        event = 'VimEnter'
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require 'nvim-autopairs'.setup()
        end,
        event = 'InsertEnter'
    },
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
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
        end
    },
    {
        'ojroques/nvim-bufdel',
        config = function()
            require 'bufdel'.setup({
                quit = true,
                next = 'tabs'
            })
        end,
        event = 'VimEnter'
    },
}
