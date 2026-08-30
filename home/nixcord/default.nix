{ inputs, ... }: {
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord = {
      krisp.enable = true;
      vencord.enable = true;
      openASAR.enable = false;
    };
    quickCss = ''
      * {
        font-family: "PlemolJP35 Console HS", monospace !important;
      }
    '';
    config = {
      useQuickCss = true;
      enabledThemes = [
        "noctalia.theme.css"
      ];
    };
  };
}
