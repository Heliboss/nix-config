{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common
    ../common/disk/luks-btrfs-impermanence
    ../common/users/nyaur

    ../common/optional/systemd-boot.nix
    ../common/optional/graphical.nix
    ../common/optional/steam.nix
    ../common/optional/bluetooth.nix
    ../common/optional/opentabletdriver.nix
    ../common/optional/vial-udev.nix
    ../common/optional/nix-ld.nix
    ../common/optional/gamemode.nix
    ../common/optional/waydroid.nix
    ../common/optional/flatpak.nix
    ../common/optional/linux-tkg.nix
    ../common/optional/gnupg.nix
    ../common/optional/tailscale.nix
  ];

  networking.hostName = "starflower";

  boot.kernelParams = [
    "zswap.enabled=1"
  ];

  swapDevices = [{
    device = "/swapfile";
    size = 7311;
  }];

  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  sops.age.keyFile = "/persist/starflower.txt";

  # Don't change
  system.stateVersion = "24.11";
}
