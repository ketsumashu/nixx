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
    ./gui
    ./vivaldi
    ./niri
    ./noctalia
    ./obs
    ./krisp
    ./input
    ./qutebrowser
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
