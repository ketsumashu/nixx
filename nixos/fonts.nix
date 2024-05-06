{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji-blob-bin
      (nerdfonts.override {fonts = ["FiraCode"];})
      cozette
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      plemoljp-hs
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
          "PlemolJP35 Console HS"
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
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <!-- Use heavier weights -->
          <match target="pattern">
            <test name="family"><string>PlemolJP35 Console HS</string></test>
            <test name="weight" compare="eq"><const>Regular</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Medium</const></edit>
          </match>
          <match target="pattern">
            <test name="family"><string>PlemolJP35 Console HS</string></test>
            <test name="weight" compare="eq"><const>Light</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Medium</const></edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
