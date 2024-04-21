{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin
      (nerdfonts.override {fonts = ["FiraCode"];})
      cozette
      migu
      wqy_zenhei
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
      localConf = ''
       <?xml version="1.0"?>
       <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
       <fontconfig>
         <description>Change default fonts for Steam client</description>
         <match>
           <test name="prgname">
             <string>steamwebhelper</string>
           </test>
           <test name="family" qual="any">
             <string>sans-serif</string>
           </test>
           <edit mode="prepend" name="family">
             <string>Migu 1P</string>
           </edit>
         </match>
       </fontconfig>
      '';
    };
  };
}
