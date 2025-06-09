{
  config,
  pkgs,
  ...
}: {
  programs.foot.enable = true;

  home.packages = with pkgs; [
    chafa
  ];

  home.file = {
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/foot";
  };
}
