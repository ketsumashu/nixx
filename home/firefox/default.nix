{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    nativeMessagingHosts.tridactyl = true;
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
  xdg.configFile."tridactyl/themes/substrata.css".source = ./tridactyl/substrata.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
}
