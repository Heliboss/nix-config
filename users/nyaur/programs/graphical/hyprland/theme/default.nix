{ config, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "rose-pine-gtk";
    };
  };

  home.file = {
    ".themes/rose-pine-gtk".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/theme/rose-pine-gtk";
  };
}
