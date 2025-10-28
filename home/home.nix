{
  imports = [
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
    ./programs
    ./spicetify
    ./gui
    ./qutebrowser
    ./niri
    ./hyprland
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
