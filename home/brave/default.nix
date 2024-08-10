{pkgs, ...}:{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--ozone-platform-hint=wayland"
      "--gtk-version=4"
    ];
  };
}
