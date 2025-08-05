{
  config,
  ...
}: {
  programs.waybar.enable = true;

  home.file = {
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/waybar/waybar";
  };
}
