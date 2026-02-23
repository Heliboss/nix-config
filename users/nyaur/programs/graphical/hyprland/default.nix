{ config, pkgs, ... }: {
  imports = [ ./foot ./waybar ./wofi ./swaync.nix ./theme.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    extraConfig = ''
      ${builtins.readFile ./hypr/hyprland.conf}
    '';
    plugins = [ pkgs.hyprlandPlugins.hyprbars pkgs.hyprlandPlugins.hyprexpo ];
  };

  home.file = {
    ".config/hypr/conf".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/conf";
    ".config/hypr/bin".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/bin";
  };

  xdg.portal = {
    extraPortals =
      [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
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
    wttrbar
    gsimplecal
  ];
}
