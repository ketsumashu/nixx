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
    package = pkgs.floorp-bin;
    nativeMessagingHosts = with pkgs; [
      tridactyl-native
      pywalfox-native
    ];
  };

  xdg.configFile."tridactyl/themes/poimandres.css".source = ./tridactyl/poimandres.css;
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
}
