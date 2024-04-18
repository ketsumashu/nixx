{
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    (nerdfonts.override {fonts = ["FiraCode"];})
    cozette
  ];
}
