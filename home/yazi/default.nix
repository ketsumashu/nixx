{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    plugins.full-border = {
      package = pkgs.yaziPlugins.full-border;
      setup = true;
    };
  };
}
