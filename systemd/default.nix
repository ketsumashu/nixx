# pkgs is used to fetch screen & irssi.
 {...}: 
 {
   # ircSession is the name of the new service we'll be creating
   systemd.services.chownX11 = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "chown /tmp/.X11-unix to mashu for executing gamescope in Steam app";
      serviceConfig = {
        Type = "simple";
        ExecStart = ''chown mashu /tmp/.X11-unix''; 
        Restart = "no";
      };
   };
 }
