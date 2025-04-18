{
  config,
  pkgs,
  ...
}: {
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
      nodePackages.nodejs
    ];
  };

  home.file = {
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/nvim";
  };

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/state/nvim"
      ".local/share/nvim"
    ];
  };
}
