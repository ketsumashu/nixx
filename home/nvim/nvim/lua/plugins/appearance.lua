return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            require("ibl").setup()
        end,
        event = 'VimEnter',
    },
    {
        'olivercederborg/poimandres.nvim',
        event = 'VimEnter',
        config = function()
            require 'poimandres'.setup {
                disable_italics = true,
                disable_background = true,
            }
            vim.cmd [[colorscheme poimandres]]
            vim.cmd [[highlight FloatBorder guibg=NONE]]
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end,
        event = "bufRead",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "rust", "css" },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            }
        end
    }
}
