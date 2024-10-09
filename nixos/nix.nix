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

  programs.nh = {
    enable = true;
  };
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
      stdenv.cc.cc
      util-linux
      zlib
      zstd
      nss
      dbus
      libgcc
    ];
  };

  system.stateVersion = "24.05";
}
