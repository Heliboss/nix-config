{
  config,
  ...
}: {
  programs.waybar.enable = true;

  home.file = {
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/waybar";
  };
}
