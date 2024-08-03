{
  imports = [
    ./hyprland
    ./nvim
    ./fish
    ./terminals
    ./waybar
    ./starship
    ./libskk
    ./rofi
    ./mako
    ./localfont
    ./scripts
    ./firefox
    ./vivaldi
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
