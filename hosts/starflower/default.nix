{
  lib,
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

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 7311;
  }];

  systemd.services.zram-loopback = {
    description = "Attach /swap/swapfile to /dev/loop0 for zram writeback";
    script = ''
      if [ -z $(losetup -j /swap/swapfile) ]; then
        losetup /dev/loop0 /swap/swapfile
      fi
      echo /dev/loop0 > /sys/block/zram0/backing_dev
    '';
    wantedBy = [ "sysinit.target" ];
    wants = [ "swap-swapfile.swap" ];
    path = [ "/run/current-system/sw" ];
    conflicts = [ "systemd-zram-setup@zram0.service" ];
    onSuccess = [ "systemd-zram-setup@zram0.service" ];
    serviceConfig = {
      PrivateDevices = false;
      DeviceAllow = [ "/dev/loop-control" "/dev/loop0" ];
    };
  };

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
