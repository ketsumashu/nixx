{
  pkgs,
  inputs,
  ...
}: let
  myPackages = inputs.self.outputs.packages.${pkgs.system};
in {
  fonts = {
    packages =
      (with pkgs; [
        noto-fonts-emoji-blob-bin
        (nerdfonts.override {fonts = ["FiraCode"];})
        cozette
      ])
      ++ (with myPackages; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ]);
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
