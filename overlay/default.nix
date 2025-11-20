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
      qutebrowser = prev.qutebrowser.override { enableWideVine = true; };
    })
  ];
}
