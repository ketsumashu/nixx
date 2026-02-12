{ pkgs, ... }:
{
  programs.nixvim.colorschemes.poimandres = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      disable_background = true;
    };
  };
}
