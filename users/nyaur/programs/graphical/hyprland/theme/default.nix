{ config, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    ".local/share/color-schemes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/theme/color-schemes";
    ".config/gtk-3.0".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/theme/gtk-3.0";
    ".config/gtk-4.0".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/theme/gtk-4.0";
  };
}
