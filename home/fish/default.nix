{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
  
  xdg.configFile."fish/conf.d/nix-env.fish" = ./nix-env.fish;

}

