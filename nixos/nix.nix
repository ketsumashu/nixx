{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  programs = {
    nh = {
      enable = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };

  };
  services = {
    envfs = {
      enable = true;
    };
  };

  system.stateVersion = "26.05";
}
