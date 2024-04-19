{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/foot";
    theme = ./rosepinekai.rasi;
  };
}
