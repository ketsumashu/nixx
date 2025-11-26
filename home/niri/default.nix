{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    BROWSER = "qutebrowser";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORM_THEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
  };

  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
