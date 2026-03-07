{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  xdg.configFile = {
    "noctalia/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/noctalia/settings.json";
  };
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };
}
