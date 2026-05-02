{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set -gx NIXPKGS_ALLOW_UNFREE 1
      starship init fish | source
      abbr -a sw "nh os switch --impure"
      abbr -a gg "cd ~/nixx && git add . && git commit --allow-empty-message -m \" \"  && git push"
      abbr -a nc "nh clean all"
      abbr -a ll "eza -al"
      abbr -a nrun "nix run nixpkgs#"
      abbr -a up "cd ~/nixx && nix flake update"
      abbr -a df "duf --theme ansi --output mountpoint,size,used,avail,filesystem --only local,fuse"
      fish_vi_key_bindings
      bind -M insert -m default jj backward-char force-repaint
    '';
  };
}
