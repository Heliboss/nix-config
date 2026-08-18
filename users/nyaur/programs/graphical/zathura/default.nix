{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ zathura ];

  home.file = {
    ".config/zathura/zathurarc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/zathura/zathurarc";
  };
}
