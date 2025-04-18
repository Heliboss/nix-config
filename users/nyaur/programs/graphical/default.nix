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
  ];

  fonts.fontconfig.enable = true;

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
