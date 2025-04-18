{
  inputs,
  device,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  # Required for impermanence to work properly.
  fileSystems."/persist".neededForBoot = true;

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        inherit device;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "root";
		askPassword = true;
                settings.allowDiscards = true;
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [ "compress-force=zstd:1" "noatime" "subvol=@" ];
                    };
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress-force=zstd:1" "noatime" "subvol=@persist" ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress-force=zstd:1" "noatime" "subvol=@nix" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
