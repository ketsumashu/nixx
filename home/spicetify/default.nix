{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "rosepine";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      popupLyrics
      lastfm
      playlistIcons
      keyboardShortcut
    ];
  };
}
