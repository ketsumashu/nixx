{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = pkgs.lib.mkDefault true;
  };
}
