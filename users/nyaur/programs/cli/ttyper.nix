{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ttyper
  ];

  home.file = {
    ".config/ttyper".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/ttyper";
  };
}
