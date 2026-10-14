{ config, ... }: {
  home.file = {
    ".config/OpenTabletDriver/Presets".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/opentabletdriver/config/Presets";
    ".config/OpenTabletDriver/Plugins".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/opentabletdriver/config/Plugins";
  };
}
