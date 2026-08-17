return {
  {
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.config
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        ghost_text = { enabled = true, },
        menu = {
          draw = { treesitter = { 'lsp' }, },
          border = 'double'
        },
        documentation = {
          auto_show = false,
          window = { border = 'double' },
        },
        signature = {
          window = { border = { 'single' }, },
        },
      },

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
