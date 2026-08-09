return {
  {
    "nvim-neotest/nvim-nio",
    lazy = true,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
  },
  {
    "Wansmer/treesj",
    cmd = "TSJToggle",
  },
  {
    "kevinhwang91/nvim-ufo",
    keys = {
      { "zR", mode = "n" },
      { "zM", mode = "n" },
    },
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
}
