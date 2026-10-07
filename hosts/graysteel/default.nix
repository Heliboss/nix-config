{
  imports = [
    ./hardware-configuration.nix
    ./minecraft-server.nix

    ../common/global
    ../common/disk/btrfs-subvolumes
    ../common/users/nyaur

    ../common/optional/systemd-boot.nix
    ../common/optional/dnscrypt-proxy.nix
    ../common/optional/nix-ld.nix
    ../common/optional/openssh.nix
  ];

  networking.hostName = "graysteel";

  boot.zswap.enable = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 3835;
    }
  ];

  sops.age.keyFile = "/etc/nixos/graysteel.txt";

  # Don't change
  system.stateVersion = "26.05";
}
