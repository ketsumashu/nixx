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
    # Nightfox colors for Kitty
## name: duskfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/duskfox/kitty.conf

background #232136
foreground #e0def4
selection_background #433c59
selection_foreground #e0def4
cursor_text_color #232136
url_color #a3be8c

# Cursor
# uncomment for reverse background
# cursor none
cursor #e0def4

# Border
active_border_color #569fba
inactive_border_color #4b4673
bell_border_color #ea9a97

# Tabs
active_tab_background #569fba
active_tab_foreground #191726
inactive_tab_background #433c59
inactive_tab_foreground #817c9c

# normal
color0 #393552
color1 #eb6f92
color2 #a3be8c
color3 #f6c177
color4 #569fba
color5 #c4a7e7
color6 #9ccfd8
color7 #e0def4

# bright
color8 #47407d
color9 #f083a2
color10 #b1d196
color11 #f9cb8c
color12 #65b1cd
color13 #ccb1ed
color14 #a6dae3
color15 #e2e0f7

# extended colors
color16 #ea9a97
color17 #eb98c3
    '';
  };
}
