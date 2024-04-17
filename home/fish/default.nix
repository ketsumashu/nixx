{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
  };
  
  xdg.configFile."fish/conf.d/nix-env.fish" = ./nix-env.fish;

}

