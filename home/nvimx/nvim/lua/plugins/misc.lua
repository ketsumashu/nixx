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
        Rule("{", "}", "nix")
            :with_pair(cond.not_after_regex("}"))
            :replace_endpair(function(opts)
              local before_cursor = opts.line:sub(1, opts.col - 1)
              if before_cursor:match("=%s*$") then
                return "};"
              end
              return "}"
            end),
      })
    end,
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
      notify = { enabled = true },
      messages = { enabled = true },
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
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
}
