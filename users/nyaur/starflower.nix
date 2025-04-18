{
  config,
  pkgs,
  inputs,
  ...
}: let
  FLAKE = "/persist/home/nyaur/.config/nixos";
in {
  imports = [
    (import ./default.nix { inherit inputs; })
    ./programs/graphical/hyprland
    (import ./programs/graphical { inherit config pkgs inputs; })
    ./programs/cli
    ./programs/gaming
    ./programs/productivity
    ./programs/creativity
    (import ./programs/flatpak { inherit inputs; })
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/nixos"
    ];
  };

  # Wallpaper
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swaybg -o \"*\" -i ${FLAKE}/users/nyaur/dotfiles/.config/hypr/wallpaper/amy.jpg -m fill"
      "sleep 1; qpwgraph -am ${FLAKE}/default.qpwgraph"
      "sleep 1; otd loadsettings ${FLAKE}/users/nyaur/dotfiles/.config/OpenTabletDriver/Presets/FPS.json"
    ];
  };

  # Host specific monitor configuration
  wayland.windowManager.hyprland.extraConfig = ''
    monitor = desc:Chimei Innolux Corporation 0x14D4, 1920x1080@60.01, 1920x0, 1
    monitor = desc:Samsung Electric Company S24F350 H4ZH700847, 1920x1080@71.91, 0x0, 1, vrr, 2
  '';

  home.sessionVariables = {
    inherit FLAKE;
  };
}
