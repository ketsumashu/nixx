{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    drun-display-format = "{name}";
    terminal = "${pkgs.foot}/bin/foot";
    theme = ./rosepinekai.rasi;
  };
}
