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
    ".config/foot/foot.ini".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/foot/foot.ini";
  };
}
