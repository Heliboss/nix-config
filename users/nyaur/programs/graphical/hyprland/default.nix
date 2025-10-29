{ config, pkgs, inputs, ... }: {
  imports = [ ./foot ./waybar ./wofi.nix ./swaync.nix ./theme.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    extraConfig = ''
      ${builtins.readFile ./hypr/hyprland.conf}
    '';
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
  };

  home.file = {
    ".config/hypr/conf".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/conf";
    ".config/hypr/bin".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/bin";
  };

  xdg.portal = {
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
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
    wttrbar
  ];
}
