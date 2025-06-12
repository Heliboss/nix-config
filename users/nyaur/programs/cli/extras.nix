{
  config,
  ...
}: {
  home.file = {
    ".config/yt-x/yt-x.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/yt-x/yt-x.conf";
  };
}
