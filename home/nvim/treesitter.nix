{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      indent = true;
      settings = {
        highlight.enable = true;
      };
    };
  };
}
