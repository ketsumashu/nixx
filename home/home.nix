{
  imports = [
    ./fish
    ./terminals
    ./starship
    ./libskk
    ./localfont
    ./scripts
    ./programs
    ./gui
    ./niri
    ./input
    ./noctalia
    ./firefox
    ./nixcord
    ./nvimx
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
