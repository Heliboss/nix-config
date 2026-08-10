{ config, ... }:
{
  programs.fish.enable = true;

  home.file = {
    ".config/fish/conf.d".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/fish/conf.d";
    ".config/fish/functions.d".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/fish/functions";
  };
}
