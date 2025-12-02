{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    BROWSER = "qutebrowser";
    QT_QPA_PLATFORM = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    GTK_IM_MODULE= "fcitx5";
    QT_IM_MODULE="fcitx5";
    HYPRCURSOR_SIZE = "24";
  };
  home.packages = with pkgs; [
    niri
    nirius
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
