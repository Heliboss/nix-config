{
  config,
  ...
}: {
  services.easyeffects.enable = true;

  home.file = {
    ".config/easyeffects/autoload".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/easyeffects/autoload";
    ".config/easyeffects/input".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/easyeffects/input";
    ".config/easyeffects/output".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/easyeffects/output";
  };
}
