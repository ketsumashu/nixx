{ pkgs,inputs, ... }:

{
  imports = [
  inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  };

  xdg.configFile."tridactyl/themes/poimandres.css".source = ./tridactyl/poimandres.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
}
