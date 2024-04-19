{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    packages = pkgs.rofi-wayland;
    terminal = "${pkgs.foot}/bin/foot";
    theme = ./rosepinekai.rasi;
  };
}
