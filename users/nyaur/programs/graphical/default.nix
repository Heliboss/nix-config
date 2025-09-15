{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./firefox
    ./easyeffects
    ./pavucontrol.nix
    ./dolphin
    ./qbittorrent.nix
    ./discord.nix
    ./messenger.nix
    ./spotify.nix
    ./zathura.nix
  ];

  fonts.fontconfig.enable = true;

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/icons"
    ];
  };

  home.packages = with pkgs; [
    adwaita-icon-theme
    noto-fonts
    corefonts
    vistafonts
    aporetic
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    blueberry
    playerctl
    mpv
    vial
    feh
    qpwgraph
    keepassxc
  ];
}
