{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
