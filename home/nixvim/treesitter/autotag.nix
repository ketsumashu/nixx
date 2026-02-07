{ pkgs, ... }:
{
  programs.nixvim.plugins.ts-autotag.enable = pkgs.lib.mkDefault true;
}
