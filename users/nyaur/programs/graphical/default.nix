{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    (import ./firefox { inherit pkgs inputs; })
    ./easyeffects.nix
    ./pavucontrol.nix
    ./dolphin.nix
    ./dark-mode.nix
    ./qbittorrent.nix
    ./discord.nix
    ./messenger.nix
    ./spotify.nix
    ./bitwarden.nix
    ./zathura.nix
  ];

  fonts.fontconfig.enable = true;

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/icons"
    ];
  };

  home.packages = with pkgs; [
    corefonts
    vistafonts
    nerd-fonts.iosevka
    blueberry
    playerctl
    mpv
    vial
    feh
    qpwgraph
    keepassxc
  ];
}
