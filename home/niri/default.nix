{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = lib.mkDefault "niri";
    XDG_SESSION_DESKTOP = lib.mkDefault "niri";
    BROWSER = "qutebrowser";
  };

  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
