{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;

    settings = {
      theme = "noctalia";
      default_shell = "fish";
      show_startup_tips = false;

      web_client.font = "PlemolJP35 Console HS";
    };
  };
}
