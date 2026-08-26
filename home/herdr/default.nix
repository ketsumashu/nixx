{
  programs.herdr = {
    enable = true;
    settings = {
      onboarding = false;
      terminal = {
        default_shell = "fish";
      };
      experimental = {
        kitty_graphics = true;
      };
    };
  };
}
