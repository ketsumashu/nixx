return {
  {
    "windwp/nvim-autopairs",
    opts = {
      checkTs = true,
      map_cr = true,
    },
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      npairs.setup(opts)
      npairs.get_rules("{")[1]:with_pair(cond.not_filetypes({ "nix" }))
      npairs.add_rules({
        Rule("{", "};", "nix"):with_pair(cond.not_after_regex("}")),
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "NvimTreeNormal",
            padding = 1,
          },
        },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "horizontal",
      float_opts = { border = "shadow" },
      shell = "fish",
      terminal_mappings = true,
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
  },
  {
    "ethanholz/nvim-lastplace",
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      level = "info",
      background_colour = "#131313",
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = false,
        lsp_doc_border = true,
      },
      notify = { enabled = false },
      messages = { enabled = false },
      routes = {
        {
          view = "notify",
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
    },
  },
  {
    "famiu/bufdelete.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
}
