{ config, pkgs, lib ... }:{

 overlays = [
      (self: super: {
        fcitx5 = super.fcitx5.overrideAttrs (old: rec {
          inherit (old) pname;
          version = "5.1.9";
          src = super.fetchFromGitHub {
            owner = "fcitx";
            repo = pname;
            rev = "45c024abc26dcfe07fc688a6b022e484b8275117";
            sha256 = "";
          };
        });
      })
    ];
}
