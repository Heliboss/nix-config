let
  FLAKE = "/persist/home/nyaur/.config/nixos";
in
{
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

  home.persistence."/persist" = {
    directories = [ ".config/nixos" ];
  };

  # Wallpaper
  wayland.windowManager.hyprland.settings = {
    exec_cmd = [
      "sleep 1; otd loadsettings ${FLAKE}/users/nyaur/programs/creativity/OpenTabletDriver/Presets/Art.json"
      "sleep 5; easyeffects -w --service-mode"
      "sleep 6; easyeffects -l 'Arctis 3'"
      "sleep 6; easyeffects -l 'Laptop Mic'"
    ];
    workspace_rule = [
      {
        workspace = "1";
        monitor = "eDP-1";
      }
      {
        workspace = "3";
        monitor = "eDP-1";
      }
      {
        workspace = "5";
        monitor = "eDP-1";
      }
      {
        workspace = "7";
        monitor = "eDP-1";
      }
      {
        workspace = "9";
        monitor = "eDP-1";
      }
      {
        workspace = "2";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "4";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "6";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "8";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "10";
        monitor = "HDMI-A-1";
      }
    ];
  };

  # Host specific monitor configuration
  wayland.windowManager.hyprland.extraConfig = ''
    hl.monitor({ output = "desc:Chimei Innolux Corporation 0x14D4", mode = "1920x1080@60.01", position = "1920x0", scale = 1 })
    hl.monitor({ output = "desc:Samsung Electric Company S24F350 H4ZH700847", mode = "1920x1080@71.91", position = "0x0", scale = 1 })
  '';

  home.sessionVariables = {
    inherit FLAKE;
    NH_FLAKE = FLAKE;
  };

  # Update legacy behavior
  wayland.windowManager.hyprland.configType = "lua";
}
