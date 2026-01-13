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
    deno
    xdg-utils
    darktable
    which
    gh
    wget
    git
    xwayland-satellite
    nautilus
    discord
    (openjdk.override {enableJavaFX = true;})
  ];

}
