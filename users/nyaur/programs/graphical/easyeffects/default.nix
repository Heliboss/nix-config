{
  config,
  ...
}: {
  services.easyeffects.enable = true;

  home.file = {
    ".config/easyeffects/autoload".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/easyeffects/autoload";
    ".config/easyeffects/input".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/easyeffects/input";
    ".config/easyeffects/output".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/easyeffects/easyeffects/output";
  };
}
