{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    codex
  ];
  programs.herdr.enable = true;
  xdg.configFile."herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/herdr/config.toml";
}
