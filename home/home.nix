{
  imports = [
    ./nvim
    ./fish
    ./terminals
    ./foot
    ./starship
    ./libskk
    ./localfont
    ./scripts
    ./programs
    ./spicetify
    ./gui
    ./vivaldi
    ./niri
    ./hyprland
    ./noctalia
    ./waybar
    ./sway
    ./obs
    ./hyprland
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
