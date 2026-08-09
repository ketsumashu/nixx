return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = { colors = false },
      layout = { align = "center" },
      notify = false,
      triggers_no_wait = { "`", "'", "<leader>", "g`", "g'", '"', "<c-r>", "z=" },
      win = {
        border = "rounded",
        padding = { 1, 2 },
        title = true,
        zindex = 10,
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>l", group = "LSP" },
        { "<leader>p", group = "Parameter swap" },
        { "<leader>z", group = "Zen" },
      })
    end,
  },
}
