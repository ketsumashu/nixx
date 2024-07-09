{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/foot";
    theme = ./theme.rasi;

    extraConfig = {
      drun-display-format = "{name}";
    };
  };
}
