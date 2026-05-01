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
    # flakeのinputsから渡ってきたバイナリソース
        yaskkserv2-bin = inputs.yaskkserv2-bin;
      };
    })
  ];
}
