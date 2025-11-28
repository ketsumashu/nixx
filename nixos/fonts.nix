{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji-blob-bin
      nerd-fonts.fira-code
      cozette
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      plemoljp-hs
      hackgen-nf-font
      moralerspace
      terminus_font
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
          "Moralerspace Argon"
          "Blobmoji"
        ];
        monospace = [
          "Moralerspace Argon"
          "Blobmoji"
        ];
        emoji = [ "Blobmoji" ];
      };
      hinting = {
        enable = true;
        style = "none";
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
          <match target="pattern">
            <test name="family"><string>HackGen Console NF</string></test>
            <test name="weight" compare="eq"><const>Regular</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Medium</const></edit>
          </match>
          <match target="pattern">
            <test name="family"><string>HackGen Console NF</string></test>
            <test name="weight" compare="eq"><const>Light</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Medium</const></edit>
          </match>
          <match target="pattern">
            <test name="family"><string>Moralerspace Argon</string></test>
            <test name="weight" compare="eq"><const>Regular</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Bold</const></edit>
          </match>
          <match target="pattern">
            <test name="family"><string>Moralerspace Argon</string></test>
            <test name="weight" compare="eq"><const>Light</const></test>
            <edit name="weight" mode="assign" binding="strong"><const>Bold</const></edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
