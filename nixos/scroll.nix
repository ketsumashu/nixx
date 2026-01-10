{pkgs,scroll-flake, ...}:
{
  imports = [scroll-flake.nixosModules.default];
  programs.scroll = {
    enable = true;
    package = scroll-flake.packages.${pkgs.stdenv.hostPlatform.system}.scroll-git;
  };
}
