{ pkgs, ... }:
{
  programs.nixvim.colorschemes.poimandres = {
    enable = pkgs.lib.mkDefault true;
    lazyload.enable = true;
    settings = {
      disable_background = true;
      disable_float_background = true;
      disable_italics = true;
    };
  };
}
