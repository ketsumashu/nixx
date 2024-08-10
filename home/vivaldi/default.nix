{pkgs, ...}:{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
      "--ozone-platform-hint=wayland"
      "--gtk-version=4"
    ];
  };
}
