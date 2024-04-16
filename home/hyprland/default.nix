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
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
      disable_autoreload = true; # we are nixed up, we don't need this
    };
    binds = {
      scroll_event_delay = 0;
    };
    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 25;
        passes = 3;
        vibrancy = 0.1696;
      };
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
    };
    animations = {
      enabled = true;

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
      ];

      animation = [
        "windows, 1, 4, myBezier"
        "windowsOut, 1, 4, default, popin 80%"
        "border, 1, 5, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    input = {
      follow_mouse = 2;
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
        ", Print, exec, grimblast copy area"
        "SHIFT, Print, exec, grimblast copysave area"
        "$mod, Return, exec, $terminal"
        #"$mod, C, exec, chromium" #replace with color picker
        "$mod CTRL, Q, exit"
        "$mod, Space, exec, rofi -show run"
        "$mod, X, killactive"
        "$mod, E, exec, nemo"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
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
