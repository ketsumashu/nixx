{
  config,
  pkgs,
  lib,
  fetchFromGitHub,
  ...
}: {
  nixpkgs.overlays = [
    (self: super: {
      fcitx5 = super.fcitx5.overrideAttrs (old: rec {
        inherit (old) pname;
        version = "5.1.10";
        src = super.fetchFromGitHub {
          owner = "fcitx";
          repo = pname;
          rev = "45c024abc26dcfe07fc688a6b022e484b8275117";
          sha256 = "sha256-/fFlXLQR6MP14yrXaIQ7ND2CdQxCcKB0xROx7YcpNlQ=";
        };
      });
    })

    (final: prev: {
      steam = prev.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            keyutils
            libkrb5
            migu
          ];
      };
    })
  ];
}
