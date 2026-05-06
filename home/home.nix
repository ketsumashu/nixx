{
  imports = [
    ./nixvim
    ./fish
    ./terminals
    ./foot
    ./starship
    ./wezterm
    ./libskk
    ./localfont
    ./scripts
    ./programs
    ./gui
    ./vivaldi
    ./niri
    ./input
    ./noctalia
    ./krisp
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
