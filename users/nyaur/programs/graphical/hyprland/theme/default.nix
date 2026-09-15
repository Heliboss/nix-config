{ config, ... }:
{
  home.file = {
    ".local/share/color-schemes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/theme/color-schemes";
  };
}
