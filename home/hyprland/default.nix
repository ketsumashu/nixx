{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "Super_L";
    "$terminal" = "foot";
    monitor = [
		  "HDMI-A-2,2560x1440@144,0x0,1"
      "DP-1,2560x1440@100,2560x0,1"
    ];
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 1;
      disable_autoreload = true; # we are nixed up, we don't need this
    };
    binds = {
      scroll_event_delay = 0;
    };
    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 2;
        passes = 3;
        popups = true;
        contrast = 1;
        noise = 0.01;
        brightness = 0.92;
      };
      drop_shadow = true;
      shadow_range = 3;
      shadow_render_power = 3;
      };
      animations = {
        enabled = true;

      bezier = [
         "myBezier, 0.05, 0.9, 0.1, 1.05"
         "cubic, 0.1, 0.23, 0.41, 0.9"
      ];
      animation = [
         "windows, 1, 1.2, cubic, slide"
         "border, 1, 0.1, default"
         "borderangle, 0, 0.2, default"
         "fade, 1, 4, default"
         "workspaces, 1, 4, default, fade"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
    };

    master = {
      new_is_master = true;
    };

    input = {
    kb_layout = "us";
    kb_options = "ctrl:nocaps";
    repeat_delay = 270;
    repeat_rate = 50;
    };

    exec-once = [
      "hypridle"
      "waybar"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    bind =
      [
        # firefox is $mod + F, kitty is $mod + ENTER
        "$mod, B, exec, firefox"
        "$mod, Return, exec, $terminal"
        "$mod CTRL, Q, exit"
        "$mod, Space, exec, rofi -show drun"
        "$mod, X, killactive"
        "$mod, E, exec, discord"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "Alt_L, Tab, workspace, e+1"
        "Alt_l SHIFT, Tab, workspace, e-1"
        "$mod, minus, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        "$mod, equal, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        "$mod, V, togglefloating"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

}
