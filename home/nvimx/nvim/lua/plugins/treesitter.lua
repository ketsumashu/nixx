return {
  {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nix",
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  },
}
