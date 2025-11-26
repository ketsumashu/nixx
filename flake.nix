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
    zen = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins?rev=a5a6f93d72d5fb37e78b98c756cfd8b340e71a19";
      inputs.hyprland.follows = "hyprland";
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      nixos-hardware,
      spicetify-nix,
      zen,
      hyprland,
      hyprland-plugins,
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
                  inherit spicetify-nix;
                  inherit zen;
                  inherit hyprland;
                  inherit hyprland-plugins;
                };
              };
            }
          ];
        };
      };
      formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixfmt-tree;
    };
}
