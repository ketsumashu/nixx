{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    BROWSER = "qutebrowser";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
