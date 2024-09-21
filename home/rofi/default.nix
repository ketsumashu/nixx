{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./theme.rasi;

    extraConfig = { drun-display-format = "{name}"; };
  };
}
