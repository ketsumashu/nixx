{ inputs, ...}: {
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord = {
      krisp.enable = true;
      vencord.enable = false;
      openASAR.enable = true;
    };
  };
}
