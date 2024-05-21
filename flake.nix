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
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    waybar.url = "github:alexays/waybar";
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixvim,
    nixos-hardware,
    wayland-pipewire-idle-inhibit,
    spicetify-nix,
    hyprland,
    waybar,
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
                inherit spicetify-nix;
                inherit wayland-pipewire-idle-inhibit;
                inherit hyprland;
                inherit waybar;
              };
            };
          }
        ];
      };
    };
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".alejandra;
  };
}
