{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      indent = true;
      settings.highlight.enable = true;
    };
  };
}
