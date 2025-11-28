{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        login-shell = "yes";
        app-id = "foot";
        title = "foot";
        font = "terminus:size=11,mplus12:size=10";
        font-bold = "terminus:size=11,mplus12:size=10";
        font-italic = "terminus:size=11,mplus12:size=10";
        font-bold-italic = "terminus:size=11,mplus12:size=10";
        line-height = 12.2;
        letter-spacing = 1.12;
        vertical-letter-offset = 1.0;
        dpi-aware = false;
        pad = "20x15 center"; # optionally append 'center'
        initial-window-size-pixels = "640x200";
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };
      colors = {
        alpha = 0.94;
        background = "191c25";
        foreground = "c5c4d4";
        cursor = "191724 e0def4";
        regular0 = "525566";
        regular1 = "a994b8";
        regular2 = "77adb1";
        regular3 = "c5c4d4";
        regular4 = "889bb4";
        regular5 = "a994b8";
        regular6 = "77adb1";
        regular7 = "c5c4d4";
        bright0 = "666b7f";
        bright1 = "cdb6dd";
        bright2 = "94cdd1";
        bright3 = "f0ecfe";
        bright4 = "afc5de";
        bright5 = "cdb6dd";
        bright6 = "94cdd1";
        bright7 = "f0ecfe";
      };
    };
  };
}
