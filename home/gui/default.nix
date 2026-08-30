{
  pkgs,
  config,
  lib,
  ...
}:
{
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    #style.name = "adwaita";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };

    iconTheme = {
      package = pkgs.tela-circle-icon-theme;
      name = "Tela-circle-dark";
    };
    font = {
      name = "PlemolJP35 Console HS";
      size = 12;
    };
  };
  dconf.settings = {
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "com/saivert/pwvucontrol" = {
      window-width = 1200;
      window-height = 800;
      is-maximized = false;
    };
  };
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
}
