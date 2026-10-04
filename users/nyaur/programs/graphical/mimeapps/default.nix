{ config, ... }:
{
  home.file = {
    ".config/mimeapps.list".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/mimeapps/mimeapps.list";
  };
}
