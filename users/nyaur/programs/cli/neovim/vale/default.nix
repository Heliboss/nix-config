{ config, pkgs, ... }: {
  home.packages = with pkgs; [ vale vale-ls ];

  home.file = {
    ".config/vale/.vale.ini".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/neovim/vale/.vale.ini";
  };

  home.persistence."/persist" = { directories = [ ".local/share/vale" ]; };
}
