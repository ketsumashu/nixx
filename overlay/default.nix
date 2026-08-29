{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      rocmPackages = prev.rocmPackages.overrideScope (
        rocmFinal: rocmPrev: {
          migraphx = rocmPrev.migraphx.overrideAttrs (old: {
            patches = (old.patches or [ ]) ++ [ ../pkgs/migraphx-no-tensorflow-api.patch ];
          });
        }
      );
      darktable =
        (prev.darktable.override {
          withAi = true;
          onnxruntime = prev.onnxruntime.override {
            rocmSupport = true;
            rocmPackages = final.rocmPackages;
          };
        }).overrideAttrs
          (_: rec {
            version = "5.6.1";
            src = prev.fetchurl {
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
    })
  ];
}
