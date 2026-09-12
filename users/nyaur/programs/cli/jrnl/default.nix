{ config, ... }:
{
  programs.jrnl.enable = true;

  home.file = {
    ".config/jrnl/jrnl.yaml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/jrnl/jrnl.yaml";
  };
}
