{
  programs.nixvim.extraConfigLua = ''
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
            dashboard.button("s", "Settings", ":cd ~/nixx/ | Telescope file_browser<CR>"),
            dashboard.button("q", "Quit NVIM", ":qa<CR>"),
        }
        alpha.setup(dashboard.opts)

    ---@diagnostic disable: undefined-global

        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd


        -- Remove whitespace on save
        autocmd("BufWritePre", {
            pattern = "*",
            command = ":%s/\\s\\+$//e",
        })

        -- Don't auto commenting new lines
        autocmd("BufEnter", {
            pattern = "*",
            command = "set fo-=c fo-=r fo-=o",
        })
  '';
}
