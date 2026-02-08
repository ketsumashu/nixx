{ pkgs, ... }:
{
  programs.nixvim.colorschemes.palette = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      disable_background = true;
      palettes = {
        main = {
          color0 = "#131313";
          color1 = "#ffb4ab";
          color2 = "#a8cbe2";
          color3 = "#b2ccc2";
          color4 = "#5fdbba";
          color5 = "#a8cbe2";
          color6 = "#b2ccc2";
          color7 = "#e2e2e2";
        };
      };
    };
  };
}
