{ pkgs, ... }:
{
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };

  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
  };
}
