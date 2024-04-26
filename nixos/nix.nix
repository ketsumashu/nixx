{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "-d";
    };
  };

  system.stateVersion = "24.05";
}
