{ config, ... }: {
  programs.btop = { enable = true; };

  home.file = {
    ".config/btop/btop.conf".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/btop/btop.conf";
    ".config/btop/themes".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/btop/themes";
  };
}
