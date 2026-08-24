{
  inputs,
  config,
  pkgs,
  ...
}:
{
  xdg.configFile = {
    "noctalia/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/noctalia/settings.json";
  };
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
