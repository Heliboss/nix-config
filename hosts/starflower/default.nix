{ lib, config, pkgs, inputs, ... }: {
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
    ../common/optional/joycond.nix
  ];

  networking.hostName = "starflower";

  boot = { kernelPackages = pkgs.linuxPackages_latest; };

  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  xdg.portal = {
    extraPortals = config.home-manager.users.nyaur.xdg.portal.extraPortals;
    config.common.default =
      config.home-manager.users.nyaur.xdg.portal.config.common.default;
  };

  sops.age.keyFile = "/persist/starflower.txt";

  # Don't change
  system.stateVersion = "24.11";
}
