{
  pkgs,
  config,
  lib,
  ...
}:
{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  #  style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
  #  theme = {
  #    package = pkgs.tokyonight-gtk-theme;
  #    name = "Tokyonight-Dark";
  #  };

  #  iconTheme = {
  #    package = pkgs.tela-circle-icon-theme;
  #    name = "Tela-circle-dark";
  #  };
  #  font = {
  #    name = "terminus";
  #    size = 12;
  #  };
  };
  dconf.settings = {
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
      };
      niri = {
        default = [
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  #xdg.configFile = {
  #  "gtk-4.0/assets".source =
  #    "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #  "gtk-4.0/gtk.css".source =
  #    "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #  "gtk-4.0/gtk-dark.css".source =
  #    "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  #  "gtk-4.0/config.ini".source = ./config.ini;
  #};
}
