{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    slurp
    grim
    libnotify
    meson
    swww
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
    killall
    which
    gh
    wget
    git
    xwayland-satellite
    vesktop
    arrpc
    nautilus
  ];

}
