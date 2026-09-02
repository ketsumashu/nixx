{ pkgs, ... }:

let
  hgwDnsCheck = pkgs.writeShellScript "hgw-dns-check" ''
    STATE="$XDG_RUNTIME_DIR/hgw-dns-check.state"

    if ${pkgs.bind.dnsutils}/bin/dig \
      @192.168.0.254 \
      example.com \
      A \
      +short \
      +time=2 \
      +tries=1 \
      | ${pkgs.gnugrep}/bin/grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
    then
      current=up
    else
      current=down
    fi

    previous="$(${pkgs.coreutils}/bin/cat "$STATE" 2>/dev/null || true)"

    if [ "$current" != "$previous" ]; then
      case "$current" in
        down)
          ${pkgs.libnotify}/bin/notify-send \
            --urgency=critical \
            "HGW DNS障害" \
            "BL900HWのDNSしんでるよ"
          ;;
        up)
          if [ "$previous" = down ]; then
            ${pkgs.libnotify}/bin/notify-send \
              "HGW DNS復旧" \
              "BL900HWのDNS復活したよ"
          fi
          ;;
      esac

      printf '%s\n' "$current" > "$STATE"
    fi
  '';
in
{
  systemd.user.services.hgw-dns-check = {
    Unit.Description = "Check BL900HW IPv4 DNS";

    Service = {
      Type = "oneshot";
      ExecStart = hgwDnsCheck;
    };
  };

  systemd.user.timers.hgw-dns-check = {
    Unit.Description = "Periodically check BL900HW IPv4 DNS";

    Timer = {
      OnBootSec = "2min";
      OnUnitActiveSec = "5min";
      Unit = "hgw-dns-check.service";
    };

    Install.WantedBy = [ "timers.target" ];
  };
}
