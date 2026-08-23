{
  imports = [
    ./terminals
    ./starship
    ./libskk
    ./localfont
    ./programs
    ./gui
    ./niri
    ./input
    ./noctalia
    ./firefox
    ./nixcord
    ./nvimx
    ./fish
    ./zellij
    ./obs
    ./scripts
    ./yazi
    ./hyprland
    ./herdr
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
