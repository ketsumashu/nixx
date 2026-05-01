{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    slurp
    grim
    libnotify
    meson
    pavucontrol
    lm_sensors
    dconf
    btop-rocm
    fd
    duf
    bat
    eza
    ripgrep
    xdg-utils
    darktable
    which
    gh
    wget
    git
    sl
    xwayland-satellite
    nautilus
    fastfetch
    qt6Packages.qt6ct
    tree-sitter
    vial
    (discord.override {
      withVencord = true;
    })
    yaskkserv2
  ];
}
