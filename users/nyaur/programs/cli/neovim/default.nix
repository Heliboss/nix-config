{ config, pkgs, ... }: {
  imports = [ ./vale ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gcc
      fd
      ripgrep
      fzf
      wget
      gnumake
      tree-sitter
      go
      nodePackages.nodejs
      nodePackages.markdownlint-cli
      nil
      nixd
    ];
  };

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/neovim/nvim";
  };

  home.persistence."/persist" = {
    directories = [ ".local/state/nvim" ".local/share/nvim" ];
  };
}
