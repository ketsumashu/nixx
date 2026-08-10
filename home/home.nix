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
    ./obs
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
