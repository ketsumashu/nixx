{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./hypridle.nix
    #./xdph.nix
  ];
  # home.sessionVariables = {
  #   XDG_SESSION_TYPE = "wayland";
  #   XDG_CURRENT_DESKTOP = lib.mkDefault "Hyprland";
  #   XDG_SESSION_DESKTOP = lib.mkDefault "Hyprland";
  #   QT_QPA_PLATFORM = "wayland";
  #   QT_QPA_PLATFORM_THEME = "qt6ct";
  #   QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  #   HYPRCURSOR_THEME = "Bibata-Modern-Ice";
  #   HYPRCURSOR_SIZE = "24";
  #   BROWSER = "qutebrowser";
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "hyprlang";
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/hyprland/hyprland.lua";
  };
}
#
