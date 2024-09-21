{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.floorp;
    nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  };

  xdg.configFile."tridactyl/themes/poimandres.css".source = ./tridactyl/poimandres.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
}
