{ config, ... }:
{
  programs.fastfetch.enable = true;

  home.file = {
    ".config/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/fastfetch/config";
  };

  home.persistence."/persist" = {
    directories = [
      ".cache/fastfetch"
    ];
  };
}
