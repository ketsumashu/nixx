{ pkgs, ... }: {
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
    vesktop
    arrpc
    (btop.override { rocmSupport = true; })
    fd
    duf
    bat
    eza
    ripgrep
    deno
    xdg_utils
    darktable
    killall
    which
    gh
    git
  ];
}
