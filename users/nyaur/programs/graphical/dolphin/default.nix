{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg
  ];

  home.file = {
    ".config/kdeglobals".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/dolphin/kdeglobals";
  };
}
