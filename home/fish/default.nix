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
      abbr -a sw "cd ~/nixx && sudo nixos-rebuild switch"
      abbr -a ga "git add ."
      abbr -a go "git commit --allow-empty-message \"\""
      abbr -a gu "git push"
      abbr -a nc "sudo nix-collect-garbage -d"
    '';
  };
}
