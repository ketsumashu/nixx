{
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[>](fg:#cdb6dd)";
        error_symbol = "[x](fg:#d59076)";
        vimcmd_symbol = "[<](fg:#d59076)";
      };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
      git_commit = {
        tag_symbol = " tag ";
      };
      time = {
        disabled = false;
        style = "blue";
        format = "[$time]($style) ";
      };
    };
  };
}
