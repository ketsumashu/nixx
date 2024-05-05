{
  users.users.mashu = {
    isNormalUser = true;
    description = "mashu";
    extraGroups = ["networkmanager" "wheel"];
  };
  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
    FLAKE = "/home/mashu/nixx/";
  };
  environment.pathsToLink = ["/share/fcitx5" "/share/fish"]; #おまじない

  security.polkit.enable = true;
}
