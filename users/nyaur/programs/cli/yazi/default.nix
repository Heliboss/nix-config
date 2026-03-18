{ config, ... }: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    flavors = { rose-pine = ./rose-pine.yazi; };
  };

  home.file = {
    ".config/yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/yazi/theme.toml";
  };
}
