{ config, ... }:
{
  programs.vesktop = {
    enable = true;
  };

  home.persistence."/persist" = {
    directories = [ ".config/vesktop" ];
  };

  home.file = {
    ".config/vesktop/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/vesktop/themes";
  };
}
