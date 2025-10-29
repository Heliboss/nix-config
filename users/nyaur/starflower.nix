{ config, pkgs, inputs, ... }:
let FLAKE = "/persist/home/nyaur/.config/nixos";
in {
  imports = [
    ./default.nix
    ./programs/graphical/hyprland
    ./programs/graphical
    ./programs/cli
    ./programs/gaming
    ./programs/productivity
    ./programs/creativity
    ./programs/flatpak
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [ ".config/nixos" ];
  };

  # Wallpaper
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swaybg -o '*' -i ${FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/wallpaper/samyo.jpg -m fill"
      "sleep 1; otd loadsettings ${FLAKE}/users/nyaur/programs/creativity/OpenTabletDriver/Presets/Art.json"
    ];
    workspace = [
      "1,monitor:eDP-1"
      "3,monitor:eDP-1"
      "5,monitor:eDP-1"
      "7,monitor:eDP-1"
      "9,monitor:eDP-1"
      "2,monitor:HDMI-A-1"
      "4,monitor:HDMI-A-1"
      "6,monitor:HDMI-A-1"
      "8,monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];
  };

  # Host specific monitor configuration
  wayland.windowManager.hyprland.extraConfig = ''
    monitor = desc:Chimei Innolux Corporation 0x14D4, 1920x1080@60.01, 1920x0, 1
    monitor = desc:Samsung Electric Company S24F350 H4ZH700847, 1920x1080@71.91, 0x0, 1, vrr, 2
  '';

  home.sessionVariables = {
    inherit FLAKE;
    NH_FLAKE = FLAKE;
  };
}
