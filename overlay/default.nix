{inputs, ...}:{
  nixpkgs.overlays = [
    (final: prev: {
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
