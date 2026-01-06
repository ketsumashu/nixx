{
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            keyutils
            libkrb5
          ];
      };
      vesktop = prev.vesktop.overrideAttrs (old: {
        preBuild = ''
          cp -r ${prev.electron.dist} electron-dist
          chmod -R u+w electron-dist
        '';
        buildPhase = ''
          runHook preBuild

          pnpm build
          pnpm exec electron-builder \
            --dir \
            -c.asarUnpack="**/*.node" \
            -c.electronDist="electron-dist" \
            -c.electronVersion=${prev.electron.version}

          runHook postBuild
        '';
      });
    })
  ];
}
