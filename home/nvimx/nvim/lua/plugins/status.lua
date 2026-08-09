return {
  {
    "ketsumashu/statushud.nvim",

    dev = true,
    dir = vim.fn.stdpath("config") .. "/local/statushud.nvim",

    main = "statushud",
    opts = {
      margin_right = 0,
      margin_bottom = 0,
    },
  },
}
