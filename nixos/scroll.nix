{pkgs,inputs, ...}:
{
  programs.scroll = {
    enable = true;
    package = inputs.scroll-flake.packages.${pkgs.stdenv.hostPlatform.system}.scroll-git;
  };
}
