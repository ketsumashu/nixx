{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji-blob-bin
      (nerdfonts.override {fonts = ["FiraCode"];})
      cozette
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Blobmoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Blobmoji"
        ];
        monospace = [
          "FiraCode Nerd Font"
          "Blobmoji"
        ];
        emoji = [
          "Blobmoji"
        ];
      };
    };
  };
}