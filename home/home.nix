{
  imports = [
    ./nixvim
    ./fish
    ./firefox
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
    ./noctalia
    ./input
    ./qutebrowser
    ./hyprland
  ];

  home = {
    username = "mashu";
    homeDirectory = "/home/mashu";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
