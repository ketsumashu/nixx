{ pkgs, ... }:
{
  programs.nixvim.colorschemes.palette = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      disable_background = true;
      custom_palettes = {
        main = [
          "#131313"
          "#ffb4ab"
          "#a8cbe2"
          "#b2ccc2"
          "#5fdbba"
          "#a8cbe2"
          "#b2ccc2"
          "#e2e2e2"
        ];
      };
    };
  };
}
