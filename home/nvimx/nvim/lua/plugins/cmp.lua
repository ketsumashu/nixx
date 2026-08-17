return {
  {
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.config
    opts = {
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        ghost_text = { enabled = true, },
        menu = {
          draw = { treesitter = { 'lsp' }, },
          border = 'single'
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
      keymap = { preset = 'super-tab' },
      signature = { enabled = true },
      snippets = { preset = { 'default' } },
    },
    opts_extend = { "sources.default" }
  },
}
