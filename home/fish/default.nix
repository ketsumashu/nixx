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
      abbr -a gco "git commit --allow-empty-message \"\""
      abbr -a gpu "git push"
      abbr -a ngc "sudo nix-collect-garbage -d"
    '';
  };
}
