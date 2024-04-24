{
  config,
  pkgs,
  ...
}: {
  users.users.mashu = {
    isNormalUser = true;
    description = "mashu";
    extraGroups = ["networkmanager" "wheel"];
  };
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
  };
  security.polkit.enable = true;
}
