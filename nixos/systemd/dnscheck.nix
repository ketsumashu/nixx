{ pkgs, ... }:

let
  hgwDnsCheck = pkgs.writeShellScript "hgw-dns-check" ''
    STATE=/run/hgw-dns-check.state

    if ${pkgs.bind}/bin/dig \
      @192.168.0.1 \
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
          echo "BL900HW IPv4 DNS is DOWN"
          ;;
        up)
          if [ "$previous" = down ]; then
            echo "BL900HW IPv4 DNS has RECOVERED"
          fi
          ;;
      esac

      printf '%s\n' "$current" > "$STATE"
    fi
  '';
in
{
  systemd.services.hgw-dns-check = {
    description = "Check BL900HW IPv4 DNS";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = hgwDnsCheck;
    };
  };

  systemd.timers.hgw-dns-check = {
    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnBootSec = "2min";
      OnUnitActiveSec = "5min";
      Unit = "hgw-dns-check.service";
    };
  };
}
