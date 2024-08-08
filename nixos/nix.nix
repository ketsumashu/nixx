{pkgs, ...}:{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "all";
    flake = "/home/mashu/nixx/";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glib
      fuse3
      icu
      nss
      openssl
      curl
      expat
      nspr
      atk
      cups
      dbus
      libdrm
      gdk-pixbuf
      gtk3
      gtk4
      pango
      cairo
      xorg
    ];
  };


  system.stateVersion = "24.05";
}
