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
            hyprland.url = "github:hyprwm/Hyprland";
            waybar.url = "github:Alexays/Waybar";
        };
        outputs = inputs@{ nixpkgs, waybar, home-manager, nixvim, hyprland, nixos-hardware, ... }: {
                nixosConfigurations = {
                    mashunix = nixpkgs.lib.nixosSystem {
                        system = "x86_64-linux";
                        modules = [
                            nixos-hardware.nixosModules.common-cpu-amd
                            nixos-hardware.nixosModules.common-gpu-amd
                            ./nixos/configuration.nix
                            { _module_args = { inherit inputs; } }
                            home-manager.nixosModules.home-manager {
                                home-manager = {
                                    useGlobalPkgs = true;
                                    useUserPackages = true;
                                    users.mashu = import ./home/home.nix;
                                    extraSpecialArgs = {
                                        inherit inputs;
                                        inherit waybar;
                                        inherit hyprland;
                                    };
                                };
                            }
                        ];
                    };
                };
        };
    }
