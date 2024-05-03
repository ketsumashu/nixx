{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        login-shell = "yes";
        app-id = "foot";
        title = "foot";
        font = "FiraCode Nerd Font:size=10";
        font-bold = "FiraCode Nerd Font:size=10";
        font-italic = "FiraCode Nerd Font:size=10";
        font-bold-italic = "FiraCode Nerd Font:size=10";
        line-height = 16;
        letter-spacing = 1.0;
        vertical-letter-offset = 1.0;
        dpi-aware = true;
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

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode Nerd Font";
      italic_font = "auto";
      bold_font = "auto";
      bold_italic_font = "auto";
      font_size = 11;
      disable_ligatures = "never";
      confirm_os_window_close = 0;
      window_padding_width = 24;
      adjust_line_height = 0;
      adjust_column_width = 0;
      box_drawing_scale = "0.01, 0.8, 1.5, 2";
      mouse_hide_wait = 0;
      focus_follows_mouse = "no";

      # Performance
      repaint_delay = 20;
      input_delay = 2;
      sync_to_monitor = "no";

      # Bell
      visual_bell_duration = 0;
      enable_audio_bell = "no";
      bell_on_tab = "yes";

    };
    extraConfig = ''
      modify_font cell_height 100%
      click_interval 0.5
      cursor_blink_interval 0
      modify_font cell_width 100%
      background #1b1c28
      foreground #a6accd
      cursor     #e0def4

      # Black
      color0 #1b1c28
      color8 #1b1c28

      # Red
      color1 #fcc5e9
      color9 #fcc5e9

      # Green
      color2  #5de4c7
      color10 #5de4c7

      # Yellow
      color3  #fffac2
      color11 #fffac2

      # Blue
      color4  #5de4c7
      color12 #5de4c7

      # Magenta
      color5  #fcc5e9
      color13 #fcc5e9

      # Cyan
      color6  #add7ef
      color14 #add7ef
      # White
      color7  #ffffff
      color15 #ffffff

    '';
  };
}
