{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      indent = false;
      highlight = true;
    };
    treesitter-context.enable = true;
  };
}
