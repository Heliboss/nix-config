{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ easyeffects ];

  home.file = {
    ".local/share/easyeffects/autoload".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/config/autoload";
    ".local/share/easyeffects/input".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/config/input";
    ".local/share/easyeffects/output".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/config/output";
    ".config/easyeffectsrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/config/easyeffectsrc";
    ".config/easyeffects/db/graphrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/config/graphrc";
  };
}
