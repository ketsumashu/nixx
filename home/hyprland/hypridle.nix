{ pkgs, ... }:
{
  home.packages = with pkgs; [ hypridle ];

  xdg.configFile."hypr/hypridle.conf".text = ''
    listener {
      timeout = 300                           # 5min
      on-timeout = pidof .quickshell-wrapped || noctalia-shell ipc call lockScreen toggle                   # lock screen when timeout has passed
      on-resume = notify-send "Welcome back!" # notification activity is detected after timeout has fired.
    }

    listener {
      timeout = 305                           # 5.5min
      on-timeout = niri msg action power-off-monitors  # screen off when timeout has passed
      on-resume = niri msg action power-on-monitors   # screen on when activity is detected after timeout has fired.
    }
  '';
}
