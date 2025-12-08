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
    ./localfont
    ./scripts
    ./programs
    ./spicetify
    ./gui
    ./qutebrowser
    ./niri
    ./hyprland
    ./noctalia
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
