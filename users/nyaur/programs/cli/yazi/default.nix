{ config, ... }:
{
  programs.yazi = {
    enable = true;
  };

  home.file = {
    ".config/yazi/theme.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/yazi/theme.toml";
    ".config/yazi/flavors".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/yazi/flavors";
  };
}
