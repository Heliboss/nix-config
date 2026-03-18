{ config, pkgs, ... }: {
  home.packages = with pkgs; [ easyeffects ];

  home.file = {
    ".local/share/easyeffects/autoload".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/autoload";
    ".local/share/easyeffects/input".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/input";
    ".local/share/easyeffects/output".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/output";
    ".config/easyeffectsrc".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/easyeffectsrc";
  };
}
