{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      abbr -a sw "nh os switch --ask"
      abbr -a ga "git add ."
      abbr -a go "git commit --allow-empty-message -m \" \" "
      abbr -a gu "git push"
      abbr -a nc "nh clean all"
      abbr -a ll "eza -al"
      abbr -a df "duf --theme ansi"
      fish_vi_key_bindings
      bind -M insert -m default jj backward-char force-repaint

    '';
  };
}
