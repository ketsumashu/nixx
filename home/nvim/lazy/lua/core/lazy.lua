local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                --'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
    ui = {
        icons = {
            cmd = "",
            config = "",
            event = "◴",
            ft = "",
            init = "⚙",
            keys = "",
            plugin = "pl",
            runtime = "rt",
            require = "rq",
            source = "ss",
            start = "st",
            task = "ts",
            lazy = "lz",
        }
    }
}

local splits = {
    defaults = { lazy = true },
    spec = {
        { import = "plugins" },
    }
}

require('lazy').setup(splits, opts)
