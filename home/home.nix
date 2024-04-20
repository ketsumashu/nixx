{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./nvim
    ./terminals
    ./fish
    ./waybar
    ./firefox
    ./starship
    ./libskk
    ./rofi
    ./qute
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";

    packages = with pkgs; [
      btop
      fd
      ripgrep
      blueman
      xdg_utils
    ];

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
