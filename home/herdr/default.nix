{ config, ... }: {
  programs.herdr.enable = true;
  xdg.configFile."herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/herdr/config.toml";
}
