{pkgs,scroll-flake, ...}:
{
  programs.scroll = {
    enable = true;
    package = scroll-flake.packages.${pkgs.stdenv.hostPlatform.system}.scroll-git;
  };
}
