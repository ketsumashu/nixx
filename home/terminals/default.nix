    { pkgs,config, ... }: {
        programs.enable.foot = true;
        xdg.configFile."foot/foot.ini".source = ./foot.ini;
    }
