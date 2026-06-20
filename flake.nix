{
  description = "mashu nixos configration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    #noctalia = {
    #  url = "github:noctalia-dev/noctalia";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    nixcord = {
      url = "github:FlameFlag/nixcord";
    };
    yaskkserv2-bin = {
      url = "https://github.com/wachikun/yaskkserv2/releases/download/0.1.7/yaskkserv2-0.1.7-x86_64-unknown-linux-gnu.tar.gz";
      flake = false;
    };
    zen = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      nixos-hardware,
      #noctalia,
      zen,
      nixcord,
      ...
    }:
    {
      nixosConfigurations = {
        mashu-nix-101 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
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
                  #inherit noctalia;
                  inherit nixcord;
                  inherit zen;
                };
              };
            }
          ];
        };
      };
      formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixfmt-tree;
    };
}
