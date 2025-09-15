{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.yt-x.packages.${pkgs.system}.default
  ];

  home.file = {
    ".config/yt-x/yt-x.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/yt-x/yt-x/yt-x.conf";
  };
}
