{
  imports = [
    ./nvim
    ./fish
    ./terminals
    ./waybar
    ./firefox
    ./starship
    ./libskk
    ./rofi
    ./mako
    ./localfont
    ./scripts
    ./programs
    ./spicetify
    ./gui
    ./qutebrowser
    ./niri
    ./sway
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
