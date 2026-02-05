{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.92;
      font_family = "Terminess nerd font";
      italic_font = "auto";
      bold_font = "auto";
      bold_italic_font = "auto";
      font_size = 10;
      disable_ligatures = "never";
      confirm_os_window_close = 0;
      window_padding_width = 24;
      adjust_line_height = 0;
      adjust_column_width = 0;
      box_drawing_scale = "0.01, 1, 1.3, 2";
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
      include /home/mashu/.config/kitty/themes/noctalia.conf
    '';
  };
}
