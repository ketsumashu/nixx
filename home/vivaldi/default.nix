{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
    ];
  };
}
