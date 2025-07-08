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
    ../common/optional/dnscrypt-proxy.nix
    ../common/optional/graphical.nix
    ../common/optional/steam.nix
    ../common/optional/bluetooth.nix
    ../common/optional/opentabletdriver.nix
    ../common/optional/vial-udev.nix
    ../common/optional/nix-ld.nix
    ../common/optional/gamemode.nix
    ../common/optional/waydroid.nix
    ../common/optional/flatpak.nix
    ../common/optional/gnupg.nix
    ../common/optional/virt-manager.nix
    ../common/optional/zerotier.nix
  ];

  networking.hostName = "starflower";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "zram" ];
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 7311;
  }];

  systemd.services.zramloop = {
    description = "Attach /swap/swapfile to /dev/loop0 for zram writeback";
    wantedBy = [ "multi-user.target" ];
    path = [ "/run/current-system/sw" ];
    script = ''
      if swapoff /dev/zram0; then
        echo swapoff
      fi
      sleep 1
      if rmmod zram; then
        echo unload
      fi
      sleep 1
      if modprobe zram; then
        echo load
      fi
      sleep 1
      if losetup -d /dev/loop0; then
        echo detach
      fi
      sleep 1
      if losetup /dev/loop0 /swap/swapfile; then
        echo loop
      fi
      sleep 1
      echo zstd > /sys/block/zram0/comp_algorithm
      echo /dev/loop0 > /sys/block/zram0/backing_dev
      echo 7311M > /sys/block/zram0/disksize
      sleep 1
      mkswap -U clear /dev/zram0
      swapon -d -p 100 /dev/zram0
    '';
    serviceConfig.DeviceAllow = [ "/dev/loop-control" "/dev/loop0" "/dev/zram0" ];
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
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
