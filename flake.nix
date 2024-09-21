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
  };
  outputs = inputs@{ nixpkgs, home-manager, nixvim, nixos-hardware
    , spicetify-nix, ... }: {
      nixosConfigurations = {
        mashunix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc-ssd
            ./nixos
            ./overlay
            { _module.args = { inherit inputs; }; }
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
                };
              };
            }
          ];
        };
      };
      formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixfmt-rfc-style;
    };
}
