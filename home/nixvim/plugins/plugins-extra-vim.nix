{
  pkgs,
  ...
}:
{
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    vim-repeat
    lspkind-nvim
    zen-mode-nvim
    twilight-nvim
    {
      plugin = tint-nvim;
      config = "lua require('tint').setup()";
    }
  ];
}
