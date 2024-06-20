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
    wayland-pipewire-idle-inhibit = {
      url = "github:rafaelrc7/wayland-pipewire-idle-inhibit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland ={
      type = "git";
      url = "https://github.com/hyprwm/Hyprland?ref=v0.41.1&rev=9e781040d9067c2711ec2e9f5b47b76ef70762b3";
      submodules = true;
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixvim,
    wayland-pipewire-idle-inhibit,
    hyprland,
    nixos-hardware,
    spicetify-nix,
    ...
  }: {
    nixosConfigurations = {
      mashunix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-pc-ssd
          ./nixos
          ./overlay
          {_module.args = {inherit inputs;};}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.mashu = import ./home/home.nix;
              extraSpecialArgs = {
                inherit inputs;
                inherit nixvim;
                inherit wayland-pipewire-idle-inhibit;
                inherit spicetify-nix;
                inherit hyprland;
              };
            };
          }
        ];
      };
    };
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;
  };
}
