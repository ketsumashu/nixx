{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = pkgs.lib.mkDefault true;
    lazyload.enable = true;
    settings = {
      highlight.enable = true;
    };
  };
}
