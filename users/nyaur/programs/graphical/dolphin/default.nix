{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg
  ];

  xdg.desktopEntries = {
    "org.kde.dolphin" = {
      name = "Dolphin";
      # Stylesheet intentionally does not exist; this is just here to fix a color-scheme loading issue
      exec = "dolphin -stylesheet sheet.qss %U";
      icon = "org.kde.dolphin";
    };
  };

  home.file = {
    ".config/kdeglobals".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/dolphin/kdeglobals";
    ".config/dolphinrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/dolphin/dolphinrc";
  };
}
