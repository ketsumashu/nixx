{
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
      background #1b1c28
      foreground #a6accd
      cursor     #e0def4

      # Black
      color0 #1b1c28
      color8 #a6accd

      # Red
      color1 #d0679d
      color9 #d0679d

      # Green
      color2  #5de4c7
      color10 #5de4c7

      # Yellow
      color3  #d0679d
      color11 #d0679d

      # Blue
      color4  #5de4c7
      color12 #5de4c7

      # Magenta
      color5  #d0679d
      color13 #d0679d

      # Cyan
      color6  #add7ff
      color14 #add7ff

      # White
      color7  #ffffff
      color15 #ffffff

    '';
  };
}
