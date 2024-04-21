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
    ];
    fontDir.enable = true;
    fontconfig = {
      enable = true;
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
