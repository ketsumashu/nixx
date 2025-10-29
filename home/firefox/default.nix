{ pkgs,inputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = inputs.zen.packages."${pkgs.system}".default;
    nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  };

  xdg.configFile."tridactyl/themes/poimandres.css".source = ./tridactyl/poimandres.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
}
