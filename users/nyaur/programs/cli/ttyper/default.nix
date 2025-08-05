{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ttyper
  ];

  home.file = {
    ".config/ttyper/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/ttyper/ttyper/config.toml";
  };
}
