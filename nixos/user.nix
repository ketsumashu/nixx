{config, pkgs, ...}:{
  users.users.mashu = {
    isNormalUser = true;
    description = "mashu";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
  };
  security.polkit.enable = true;
}
