{ inputs, ... }:
let
  darktableOverlay = darktableFinal: darktablePrev: {
    rocmPackages = darktablePrev.rocmPackages.overrideScope (
      rocmFinal: rocmPrev: {
        migraphx = rocmPrev.migraphx.overrideAttrs (old: {
          patches = (old.patches or [ ]) ++ [ ../pkgs/migraphx-no-tensorflow-api.patch ];
        });
      }
    );
  };
in
{
  nixpkgs.overlays = [
    (
      final: prev:
      let
        darktablePkgs = import inputs.nixpkgs-darktable {
          system = prev.stdenv.hostPlatform.system;
          config = prev.config;
          overlays = [ darktableOverlay ];
        };
      in
      {
        darktable =
          (darktablePkgs.darktable.override {
            withAi = true;
            onnxruntime = darktablePkgs.onnxruntime.override {
              rocmSupport = true;
              rocmPackages = darktablePkgs.rocmPackages;
            };
          }).overrideAttrs
            (_: rec {
              version = "5.6.1";
              src = darktablePkgs.fetchurl {
                url = "https://github.com/darktable-org/darktable/releases/download/release-${version}/darktable-${version}.tar.xz";
                hash = "sha256-6LhKyYsLaJokTkA2xLVjlMHVjOLZq8BeCgYO+fdW3DY=";
              };
            });
        steam = prev.steam.override {
          extraPkgs =
            pkgs: with pkgs; [
              keyutils
              libkrb5
            ];
        };
        yaskkserv2 = final.callPackage ../pkgs/yaskkserv2.nix {
          inherit (inputs) yaskkserv2-bin;
        };
        pipeasio = final.callPackage ../pkgs/pipeasio.nix { };
        shinonome-font = final.callPackage ../pkgs/shinonome-font.nix { };
      }
    )
  ];
}
