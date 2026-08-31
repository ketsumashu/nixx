{ config, pkgs, ... }:
{
  home.file.".config/vivaldi-custom/tabbar.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/vivaldi/tabbar.css";

  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--enable-wayland-ime"
      "wayland-text-input-version=3"
    ];
  };
}
