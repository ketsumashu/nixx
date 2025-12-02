{
  imports = [
    ./nvim
    ./fish
    ./terminals
    ./foot
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
    ./input
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
