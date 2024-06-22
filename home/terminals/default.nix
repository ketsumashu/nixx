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
      # vim:ft=kitty

      ## name: Nightfox
      ## author: EdenEast
      ## license: MIT
      ## upstream: https://github.com/EdenEast/nightfox.nvim/blob/main/extra/nightfox/nightfox_kitty.conf

      background #192330
      foreground #cdcecf
      selection_background #2b3b51
      selection_foreground #cdcecf
      url_color #81b29a

      # Cursor
      # uncomment for reverse background
      # cursor none
      cursor #cdcecf

      # Border
      active_border_color #719cd6
      inactive_border_color #39506d
      bell_border_color #f4a261

      # Tabs
      active_tab_background #719cd6
      active_tab_foreground #131a24
      inactive_tab_background #2b3b51
      inactive_tab_foreground #738091

      # normal
      color0 #393b44
      color1 #c94f6d
      color2 #81b29a
      color3 #dbc074
      color4 #719cd6
      color5 #9d79d6
      color6 #63cdcf
      color7 #dfdfe0

      # bright
      color8 #575860
      color9 #d16983
      color10 #8ebaa4
      color11 #e0c989
      color12 #86abdc
      color13 #baa1e2
      color14 #7ad5d6
      color15 #e4e4e5

      # extended colors
      color16 #f4a261
      color17 #d67ad2
    '';
  };
}
