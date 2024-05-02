{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  # import the flake's module for your system
  imports = [inputs.spicetify-nix.homeManagerModule];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "TokyoNight";
    #    customColorScheme = {
    #      text ="a6accd";
    #      subtext ="ffffff";
    #      sidebar-text ="ffffff";
    #      main="1b1c28";
    #      sidebar="1b1c28";
    #      background="1b1c28";
    #      player="1b1c28";
    #      card="1b1c28";
    #      shadow= "000000";
    #      selected-row="a6accd";
    #      button ="5de4c7";
    #      button-active="1b1c28";
    #      button-disabled="1b1c28";
    #      tab-active="5de4c7";
    #      misc="ffffff";
    #    };
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      playlistIcons
      keyboardShortcut
    ];
  };
}
