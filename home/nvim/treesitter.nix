{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      indent = true;
      ensureInstalled = ["lua" "css" "nix" ];
    };
  };
}
