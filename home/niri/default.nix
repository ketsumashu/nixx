{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    BROWSER = "vivaldi";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = lib.mkDefault "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    GTK_IM_MODULE = "simple";
  };
  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
