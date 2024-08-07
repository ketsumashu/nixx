{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.foot}/bin/kitty";
    theme = ./theme.rasi;

    extraConfig = {
      drun-display-format = "{name}";
    };
  };
}
