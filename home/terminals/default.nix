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
        line-height = 13.2;
        letter-spacing = 1.14;
        vertical-letter-offset = 1.0;
        dpi-aware = false;
        pad = "10x6 center";
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
        alpha = 0.88;
        background = "1b1c28";
        foreground = "a6accd";
        regular0 = "1b1c28";
        regular1 = "d0679d";
        regular2 = "5de4c7";
        regular3 = "fffac2";
        regular4 = "5de4c7";
        regular5 = "fcc5e9";
        regular6 = "add7ff";
        regular7 = "ffffff";
        bright0 = "a6accd";
        bright1 = "d0679d";
        bright2 = "5de4c7";
        bright3 = "fffac2";
        bright4 = "5de4c7";
        bright5 = "fae4fc";
        bright6 = "89ddff";
        bright7 = "ffffff";
      };
    };
  };
}
