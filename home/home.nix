{
  imports = [
    ./hyprland
    ./nvim
    ./foot
    ./fish
    ./waybar
    ./starship
    ./libskk
    ./rofi
    ./mako
    ./localfont
    ./spicetify
    ./firefox
    ./qutebrowser
    ./scripts
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
