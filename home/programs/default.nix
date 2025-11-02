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
    btop
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
    git
    xwayland-satellite
    vesktop
    arrpc
    bitwarden-cli
    bitwarden-menu
    python312Packages.tldextract
  ];

}
