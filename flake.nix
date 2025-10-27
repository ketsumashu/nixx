{
  description = "mashu nixos configration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nur.url = "github:nix-community/NUR";
    niri.url = "github:sodiboo/niri-flake";
    zen.url = "github:0xc000022070/zen-browser-flake";
  };
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      nixos-hardware,
      spicetify-nix,
      nur,
      zen,
      niri,
      ...
    }:
    {
      nixosConfigurations = {
        mashu-nix-101 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nur.modules.nixos.default
            niri.nixOSModules.niri
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc-ssd
            ./nixos
            ./overlay
            {
              _module.args = {
                inherit inputs;
              };
            }
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.mashu = import ./home/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  inherit nixvim;
                  inherit spicetify-nix;
                  inherit zen;
                  inherit niri;
                };
              };
            }
          ];
        };
      };
      formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixfmt-rfc-style;
    };
}
