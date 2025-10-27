{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.92;
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
      box_drawing_scale = "0.01, 1, 1.5, 2";
      mouse_hide_wait = 0;
      focus_follows_mouse = "yes";
      shell = "fish";
      remember_window_size = "no";
      initial_window_width = "800";
      initial_window_height = "300";

      # Performance
      repaint_delay = 20;
      input_delay = 2;
      sync_to_monitor = "yes";

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
      background #191c25
      foreground #a6accd
      cursor     #e0def4

      # Black
      color0 #525566
      color8 #666b7f

      # Red
      color1 #a994b8
      color9 #cdb6dd

      # Green
      color2  #77adb1
      color10 #94cdd1

      # Yellow
      color3  #c5c4d4
      color11 #f0ecfe

      # Blue
      color4  #889bb4
      color12 #afc5de

      # Magenta
      color5  #a994b8
      color13 #cdb6dd

      # Cyan
      color6  #77adb1
      color14 #94cdd1

      # White
      color7  #c5c4d4
      color15 #f0ecfe

    '';
  };
}
