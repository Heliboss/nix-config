{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
  ];

  home.file = {
    ".config/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/fastfetch/fastfetch";
  };
}
