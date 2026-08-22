{
  config,
  pkgs,
  ...
}:
{
  imports = [
    #./hypridle.nix
    #./xdph.nix
  ];
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    #   HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    #   HYPRCURSOR_SIZE = "24";
    #   BROWSER = "qutebrowser";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd.enable = false;
  };

  systemd.user.targets.hyprland-session = {
    Unit = {
      Description = "Hyprland compositor session";
      Documentation = [ "man:systemd.special(7)" ];
      BindsTo = [ "graphical-session.target" ];
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
      PropagatesStopTo = [ "graphical-session.target" ];
    };
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixx/home/hyprland/hyprland.lua";
  };
}
#
