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
      accent = "77adb1";
      accent-active = "77adb1";
      text = "c5c4d4";
      main = "191c25";
    };
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      playlistIcons
      keyboardShortcut
    ];
  };
}
