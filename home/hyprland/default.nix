{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
  ];
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORM_THEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
    BROWSER = "qutebrowser";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
      pkgs.hyprlandPlugins.hyprscrolling
    ];
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "Super_L";
    "$terminal" = "kitty";

    monitor = [
      "DP-3,2560x1440@100,0x0,1,transform,1"
      "HDMI-A-1,3840x2160@120,1440x0,1"
      "DP-1,2560x1440@120,5280x0,1,transform,3"
    ];

    workspace = [
      "1, monitor:HDMI-A-1, default:true"
      "2, monitor:HDMI-A-1, default:true"
      "3, monitor:HDMI-A-1, default:true"
      "4, monitor:HDMI-A-1, default:true"
      "5, monitor:DP-3, default:true"
      "6, monitor:DP-3, default:true"
      "7, monitor:DP-1, default:true"
      "8, monitor:DP-1, default:true"
      "9, monitor:DP-1, default:true"
    ];

    plugin = {
      hyprscrolling = {
        column_width = 0.5;
        fullscreen_on_one_column = true;
        focus_fit_method = 1;
      };
    };

    general = {
      gaps_in = 5;
      gaps_out = 9;
      border_size = 3;
      "col.active_border" = "rgb(77adb1)";
      "col.inactive_border" = "rgb(191c25)";
      layout = "scrolling";
      allow_tearing = true;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 1;
      disable_autoreload = false;
      allow_session_lock_restore = true;
      initial_workspace_tracking = 0;
    };

    binds = {
      scroll_event_delay = 0;
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 4;
        passes = 3;
        popups = true;
        contrast = 1;
        noise = 1.0e-2;
        brightness = 0.92;
      };
      shadow = {
        enabled = true;
        range = 3;
        render_power = 3;
      };
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
      pseudotile = false;
      preserve_split = true;
      force_split = 2;
    };

    master = {
      smart_resizing = true;
    };

    input = {
      kb_layout = "us";
      kb_options = "ctrl:nocaps";
      repeat_delay = 270;
      repeat_rate = 50;
      follow_mouse = 1;
    };

    windowrule = [
      "match:class ^(blueman-manager)$, float true"
      "match:class ^(xdg-desktop-portal-gtk)$, float true"
      "match:title (Save File)$, float true"
      "match:title ^(blob), float true"
      "match:class ^(org.pulseaudio.pavucontrol),max_size 900 600"
      "match:class ^(Floaterm)$, max_size 900 600"
      "match:class (vesktop)$, workspace 5"
      "match:class ^(steam)$, match:title (ist)$, float true"
      "match:class ^(steam)$, match:title ^(Steam Settings)$, float true"
      "match:class ^(steam)$, match:title (Chat)$, float true"
      "match:class ^(steam)$, match:title ^(Steam - News), float true"
      "match:class ^(steam)$, match:title ^(Friends List)$, float true"
      "match:class ^(steam)$, match:title (started)$, float true"
      "match:class ^(steam)$, match:title ^(Add Non-Steam Game)$, float true"
      "match:class ^(steam)$, match:title ^(Steam - Self Updater)$, float true"
      "match:class ^(steam)$, match:title (Manager)$, float true"
      "match:class ^(steam)$, match:title (フレンドリスト)$, float true"
      "match:class ^(steam)$, match:title ^(Steam Guard - Computer Authorization Required)$, float true"
    ];

    layerrule = [ "match:namespace waybar, blur on" ];

    exec-once = [
      "systemctl --user enable xdg-desktop-portal-hyprland"
      "mako"
      "waybar"
      "arrpc"
      ''hyprctl dispatch exec "[workspace 2 silent]" steam''
      ''hyprctl dispatch exec "[workspace 5 silent]" "vesktop --gtk-version=4 --ozone-platform=wayland"''
      "swww-daemon"
      "openrgb --startminimized -p ~/.config/OpenRGB/pro.orp"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      ''hyprctl plugin load "${pkgs.hyprlandPlugins.hyprscrolling}/lib/libhyprscrolling.so"''
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
      "$mod, B, exec, zen"
      "$mod, E, exec, vesktop --gtk-version=4 --ozone-platform=wayland"
      "$mod, S, exec, steam"
      "$mod, I, exec, scr"
      "$mod, Return, exec, $terminal"
      "$mod, Space, exec, rofi -show drun"
      "$mod, P, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$mod, X, killactive"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"
      "$mod CTRL, Q, exit"
      "$mod SHIFT, H, layoutmsg, swapcol l"
      "$mod SHIFT, L, layoutmsg, swapcol r"
      "$mod SHIFT, K, layoutmsg, movewindowto u"
      "$mod SHIFT, J, layoutmsg, movewindowto d"
      "$mod SHIFT, F, Fullscreen"
      "$mod, C, layoutmsg, togglefit"
      "$mod, F, layoutmsg, fit active"
      "$mod ALT, F, layoutmsg,promote"
      "$mod, Tab, workspace, e+1"
      "$mod SHIFT, Tab, workspace, e-1"
      "$mod, V, togglefloating"
      "$mod, period, exec, hyprlock"
      ''$mod CTRL, T, exec, grim -o HDMI-A-1 ~/screenshot/$(date +"%Y_%m_%d".png)''
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        ) 10
      )
    );
  };
}
