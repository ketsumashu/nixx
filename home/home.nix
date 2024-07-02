{
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
    ./localfont
    ./spicetify
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
