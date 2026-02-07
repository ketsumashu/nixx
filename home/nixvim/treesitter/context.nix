{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter-context = {
    enable = pkgs.lib.mkDefault true;
  };
}
