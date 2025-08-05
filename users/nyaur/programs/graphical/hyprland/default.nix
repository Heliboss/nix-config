{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./foot.nix
    ./waybar.nix
    ./wofi.nix
    ./swaync.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ../../../dotfiles/.config/hypr/hyprland.conf}
    '';
  };

  home.file = {
    ".config/hypr/conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/dotfiles/.config/hypr/conf";
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
