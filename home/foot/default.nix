{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        login-shell = "yes";
        app-id = "foot";
        title = "foot";
        font = "Cozette:size=11,mplus12:size=9";
        font-bold = "Cozette:size=11,mplus12:size=9";
        font-italic = "Cozette:size=11,mplus12:size=9";
        font-bold-italic = "Cozette:size=11,mplus12:size=9";
        line-height = 12.2;
        letter-spacing = 1.14;
        vertical-letter-offset = 1.0;
        dpi-aware = false;
        pad = "10x6 center"; # optionally append 'center'
      };
      environment = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };
      cursor = {
        color = "191724 e0def4";
      };
      colors = {
        alpha = 0.85;
        background="191c25";
        foreground="c5c4d4";
        regular0="525566"  ;
        regular1="a994b8"  ;
        regular2="77adb1"  ;
        regular3="c5c4d4"  ;
        regular4="889bb4"  ;
        regular5="a994b8"  ;
        regular6="77adb1"  ;
        regular7="c5c4d4"  ;
        bright0="666b7f"   ;
        bright1="cdb6dd"   ;
        bright2="94cdd1"   ;
        bright3="f0ecfe"   ;
        bright4="afc5de"   ;
        bright5="cdb6dd"   ;
        bright6="94cdd1"   ;
        bright7="f0ecfe"   ;
      };
    };
  };
}
