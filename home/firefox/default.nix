{
  pkgs,
  inputs,
  ...
}:
{
  #imports = [
  #  inputs.zen.homeModules.beta
  #];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-beta-bin;
    nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  };

  xdg.configFile."tridactyl/themes/poimandres.css".source = ./tridactyl/poimandres.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;

}
