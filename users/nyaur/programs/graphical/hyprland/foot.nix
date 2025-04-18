{
  config,
  ...
}: {
  programs.foot.enable = true;

  home.file = {
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/foot";
  };
}
