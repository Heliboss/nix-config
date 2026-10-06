{ inputs, ... }: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  fileSystems."/home" = {
    neededForBoot = true;
    fsType = "btrfs";
  };

  environment.persistence."/home".enable = false;
  environment.persistence."/persist".enable = false;
}
