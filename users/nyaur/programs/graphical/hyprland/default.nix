{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./foot
    ./waybar
    ./wofi.nix
    ./swaync.nix
    ./theme.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./hypr/hyprland.conf}
    '';
  };

  home.file = {
    ".config/hypr/conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/hypr/conf";
  };

  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
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
  ];
}
