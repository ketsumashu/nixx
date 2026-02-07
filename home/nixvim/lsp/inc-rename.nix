{ pkgs, ... }:
{
  programs.nixvim.plugins.inc-rename.enable = pkgs.lib.mkDefault true;
}
