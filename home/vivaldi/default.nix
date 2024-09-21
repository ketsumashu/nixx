{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [ "--ozone-platform-hint=auto" ];
  };
}
