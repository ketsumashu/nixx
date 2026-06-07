{ inputs, ...}: {
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord = {
      krisp.enable = true;
      vencord.enable = true;
      settings = {
        SKIP_HOST_UPDATE = true;
      };
    };
  };
}
