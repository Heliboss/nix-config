{ config, pkgs, ... }:
{
  imports = [
    ./foot
    ./waybar
    ./rofi
    ./swaync
    ./theme
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    extraConfig = ''
      ${builtins.readFile ./hypr/hyprland.lua}
    '';
  };

  home.file = {
    ".config/hypr/conf".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/conf";
    ".config/hypr/wallpaper".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/wallpaper";
  };

  xdg.portal = {
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  home.packages = with pkgs; [
    swaybg
    hyprlock
    hyprpicker
    hypridle
    brightnessctl
    grim
    slurp
    wl-clipboard
    grimblast
    wl-screenrec
    gsimplecal
  ];
}
