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
    ./mako
    ./ncspot
    ./idle-inhibitor
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";

    packages = with pkgs; [
      ( btop.override { rocmSupport = true;})
      fd
      duf
      eza
      ripgrep
      blueman
      xdg_utils
    ];

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
