return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      whitespace = { remove_blankline_trail = true },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "lazy",
          "notify",
          "toggleterm",
          "lazyterm",
          "lspinfo",
          "packer",
          "checkhealth",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "",
        },
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
