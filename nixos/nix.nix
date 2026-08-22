{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "mashu"
      ];
      substituters = [
        "https://wezterm.cachix.org"
        "https://noctalia.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-one";
      flake = "/home/mashu/nixx/";
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
        libglvnd
        glfw
        openal
      ];
    };

  };
  services = {
    envfs = {
      enable = true;
    };
    flatpak.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gnome" ];
      niri = {
        default = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
      hyprland.default = [
        "hyprland"
        "gtk"
      ];
    };
  };
  system.stateVersion = "26.05";
}
