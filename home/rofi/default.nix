{ pkgs, ... }:

{
  programs.rofi-wayland = {
    enable = true;
    terminal = "${pkgs.foot}/bin/foot";
    theme = ./rosepinekai.rasi;
  };
}
