{ pkgs, ... }: {
  programs.qutebrowser = {
    enable =true;
    extraConfig = builtins.readFile ./config.py;
  };
}
