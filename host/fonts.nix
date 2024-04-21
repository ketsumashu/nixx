{
  pkgs,
  inputs,
  ...
}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji-blob-bin
    (nerdfonts.override {fonts = ["FiraCode"];})
    cozette
  ];
}
