{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../common/disk/btrfs-subvolumes
    ../common/users/nyaur

    ../common/optional/systemd-boot.nix
    ../common/optional/dnscrypt-proxy.nix
    ../common/optional/nix-ld.nix
    ../common/optional/openssh.nix
  ];

  networking.hostName = "graysteel";

  users.mutableUsers = false;

  # Passing system to lib.nixosSystem is deprecated
  nixpkgs.hostPlatform = "x86_64-linux";

  boot = {
    kernelPackages = pkgs.linuxPackages;
    zswap.enable = true;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 3835;
    }
  ];

  environment.systemPackages = [ pkgs.e2fsprogs ];

  sops.age.keyFile = "/etc/nixos/graysteel.txt";

  # Don't change
  system.stateVersion = "26.05";
}
