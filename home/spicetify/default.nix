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
    colorScheme = "custom";
        customColorScheme = {
          accent ="5de4c7";
          accent-active ="5de4c7";
          text ="ffffff";
          main="1b1c28";
        };
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      playlistIcons
      keyboardShortcut
    ];
  };
}
