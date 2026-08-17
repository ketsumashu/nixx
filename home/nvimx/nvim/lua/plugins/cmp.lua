return {
  --{
  --  "hrsh7th/nvim-cmp",
  --  event = "InsertEnter",
  --  dependencies = {
  --    "hrsh7th/cmp-nvim-lsp",
  --    "hrsh7th/cmp-buffer",
  --    "hrsh7th/cmp-path",
  --    {
  --      "petertriho/cmp-git",
  --      config = function()
  --        require("cmp_git").setup({})
  --      end,
  --    },
  --    {
  --      "L3MON4D3/LuaSnip",
  --      opts = {
  --        enable_autosnippets = true,
  --      },
  --    },
  --  },
  --  opts = function()
  --    local cmp = require("cmp")

  --    return {
  --      mapping = {
  --        ["<C-Space>"] = cmp.mapping.complete(),
  --        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --        ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --        ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
  --        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  --        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
  --        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  --      },
  --      snippet = {
  --        expand = function(args)
  --          require("luasnip").lsp_expand(args.body)
  --        end,
  --      },
  --      sources = {
  --        { name = "nvim_lsp" },
  --        { name = "luasnip" },
  --        { name = "path" },
  --        { name = "buffer" },
  --        { name = "git" },
  --      },
  --      window = {
  --        completion = {
  --          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --          scrollbar = false,
  --          sidePadding = 0,
  --          winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
  --        },
  --        documentation = {
  --          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --          winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
  --        },
  --      },
  --    }
  --  end,
  --},
  {
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = { documentation = { auto_show = false } },

      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          'buffer'
        },
      },
    },
    opts_extend = { "sources.default" }
  },
}
